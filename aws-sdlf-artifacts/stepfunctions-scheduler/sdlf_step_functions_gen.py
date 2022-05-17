#!/usr/bin/env python
# coding: utf-8
# Generate StepFunction based on CSV Job List and JSON global properties
# Arguments received by script: <script> joblist.csv stepglobal.json stepfunctionsfile.out
#   _joblist.csv - CSV file of list jobs to process in format:
#                  JOBID;JOBNAME;JOBGROUP;LEVEL;DOMAIN;PRE_VALIDATION_JOB_NAME;POST_VALIDATION_JOB_NAME
#                  JOBID01;JOBNAME01;1;1;DOMAINNAME
#                  JOBID02;JOBNAME02;2;1;DOMAINNAME
#                  JOBID02;JOBNAME03;3;2;DOMAINNAME
#                  JOBID02;JOBNAME04;4;2;DOMAINNAME


import json
import csv
import sys
import os
import re


# Function to print usage and check number of arguments passed to script
def usage(argsExpected) :
    if len(sys.argv) < argsExpected+1 :
        print('!Error , number of arguments passed='+ str(len(sys.argv)-1) + ' expected=' + str(argsExpected))
        print('...Usage: ' + sys.argv[0] + ' joblist.csv stepglobal.json stepfunctionname.out')
        sys.exit(0)

# Function to set variables of files used by tool
def setFiles():
    jobsFile=sys.argv[1]
    outputFile = sys.argv[2]
    return jobsFile,outputFile

# Function to read Jobs CSV File
def readJobsProperties(jobsFile):
    sJobsId=[]
    sJobNames=[]
    sJobsGroup=[]
    sLevels=[]
    sDomains=[]
    sPreValidationJobs = []
    sPostValidationJobs = []
    try:
        with open(jobsFile, mode='r') as csvFile:
            csvReader = csv.DictReader(csvFile,delimiter=';')
            lineCount = 0
            for row in csvReader:
                sJobsId.append(row['JOBID'])
                sJobNames.append(row['JOBNAME'])
                sJobsGroup.append(row['JOBGROUP'])
                sLevels.append(row['LEVEL'])
                sDomains.append(row['DOMAIN'])
                sPreValidationJobs.append(row['PRE_VALIDATION_JOB_NAME'])
                sPostValidationJobs.append(row['POST_VALIDATION_JOB_NAME'])
    except Exception as err:
        print('Error reading jobs file: ' + str(type(err)))
        print(err)
    return sJobsId,sJobNames,sJobsGroup,sLevels,sDomains,sPreValidationJobs, sPostValidationJobs


# Function to generate variables to step functions block to start and end state machine
def setStepFunctionsStartAndEnd():
    stepStart="""{
    "Comment": "Spark ETL State Machine",
    "StartAt": "Parallel Task_1",
    "States": {"""
    stepEnd=""",
        \"WorkflowEnd\": {
            \"Type\": \"Pass\",
            \"End\": true
                    }
    }
    }"""
    return stepStart,stepEnd


# Function to generate variables to step functions blocks, for Parallel, Full Job, Branch and Levels
def setStepFunctionsChains():
    startStepParallel="""
        "Parallel Task_{LEVEL_ID}": {
            "Type": "Parallel",
            "Branches": ["""
    startStepBranch="""                   {
                                         \"StartAt\":\"Spark_Job_{STARTING_JOB_ID}\",
                                         \"States\":{"""

    stepJobFullTransform="""
                                                            \"Spark_Job_{JOB_ID}\": {
                                                                                    \"Type\": \"Pass\",
                                                                                    \"Parameters\": {
                                                                                        \"StepArguments\": {
                                                                                            \"ClusterId.$\": \"$.clusterId\",
                                                                                            \"Args\": [
                                                                                                {
                                                                                                    \"Arg1\": \"/usr/bin/spark-submit\"
                                                                                                },
                                                                                                {
                                                                                                    \"Arg2\": \"--conf\"
                                                                                                },
                                                                                                {
                                                                                                    \"Arg3\": \"spark.yarn.appMasterEnv.PYTHONIOENCODING=utf8\"
                                                                                                },
                                                                                                {
                                                                                                    \"Arg4\": \"--packages\"
                                                                                                },
                                                                                                {
                                                                                                    \"Arg5\": \"com.databricks:spark-redshift_2.11:3.0.0-preview1,org.apache.spark:spark-avro_2.11:2.4.4\"
                                                                                                },
                                                                                                {
                                                                                                    \"Arg6\": \"/home/hadoop/SparkTransform/SparkTransform.py\"
                                                                                                },
                                                                                                {
                                                                                                    \"Arg7.$\": \"$.jobsBucket\"
                                                                                                },
                                                                                                {
                                                                                                    \"Arg8\": \"{JOB_NAME}\"
                                                                                                },
                                                                                                {
                                                                                                    \"Arg9.$\": \"$.workflowName\"
                                                                                                },
                                                                                                {
                                                                                                    \"Arg10\": \"{DOMAIN_NAME}\"
                                                                                                },
                                                                                                {
                                                                                                    \"Arg11.$\": \"$.startDate\"
                                                                                                },
                                                                                                {
                                                                                                    \"Arg12.$\": \"$.lastDate\"
                                                                                                }
                                                                                            ]
                                                                                        }
                                                                                    },
                                                                                    \"ResultPath\": \"$.taskresult\",
                                                                                    \"Next\": \"Exec_Spark_Job_{JOB_ID}\"
                                                                                },
                                                     
                                                     \"Exec_Spark_Job_{JOB_ID}\": {
                                                                                \"Type\": \"Task\",
                                                                                \"Resource\": \"arn:aws:states:::elasticmapreduce:addStep.sync\",
                                                                                \"Parameters\": {
                                                                                               \"ClusterId.$\": \"$.clusterId\",                    
                                                                                                 \"Step\": {
                                                                                                    \"Name\": \"Spark_Job_{JOB_ID}\",
                                                                                                    \"ActionOnFailure\": \"CONTINUE\",
                                                                                                    \"HadoopJarStep\": {
                                                                                                        \"Jar\": \"command-runner.jar\",
                                                                                                        \"Args.$\": \"$.taskresult.StepArguments.Args[*][*]\"
                                                                                                    }
                                                                                                 }
                                                                                },  
                                                                                \"Retry\": [
                                                                                            {
                                                                                                \"ErrorEquals\": [\"States.ALL\"],
                                                                                                \"IntervalSeconds\": 10,
                                                                                                \"MaxAttempts\": 1,
                                                                                                \"BackoffRate\": 1.5
                                                                                            }
                                                                                        ],
                                                                                 \"Catch\": [   {
                                                                                              \"ErrorEquals\": [\"CustomError\"],
                                                                                              \"Next\": \"FailBranch_{GROUP_ID}\"
                                                                                            }, 
                                                                                            {
                                                                                               \"ErrorEquals\": [\"States.ALL\"],
                                                                                               \"Next\": \"FailBranch_{GROUP_ID}\"
                                                                                            }
                                                                                        ],
                                                                                                            
                                                                                \"ResultPath\": \"$.taskresult\",
                                                                                \"Next\": \"Spark_Job_{NEXT_ID}{_success}\"
                                                                            },"""

    stepJobFullValidator = """
                                                               \"Spark_Job_{JOB_ID}\": {
                                                                                       \"Type\": \"Pass\",
                                                                                       \"Parameters\": {
                                                                                           \"StepArguments\": {
                                                                                               \"ClusterId.$\": \"$.clusterId\",
                                                                                               \"Args\": [
                                                                                                   {
                                                                                                       \"Arg1\": \"/usr/bin/spark-submit\"
                                                                                                   },
                                                                                                   {
                                                                                                       \"Arg2\": \"--conf\"
                                                                                                   },
                                                                                                   {
                                                                                                       \"Arg3\": \"spark.yarn.appMasterEnv.PYTHONIOENCODING=utf8\"
                                                                                                   },
                                                                                                   {
                                                                                                       \"Arg4\": \"/home/hadoop/SparkValidator/SparkValidator.py\"
                                                                                                   },
                                                                                                   {
                                                                                                       \"Arg5.$\": \"$.codeBucket\"
                                                                                                   },
                                                                                                   {
                                                                                                       \"Arg6.$\": \"$.jobsBucket\"
                                                                                                   },
                                                                                                   {
                                                                                                       \"Arg7\": \"{JOB_NAME}\"
                                                                                                   },
                                                                                                   {
                                                                                                       \"Arg8.$\": \"$.workflowName\"
                                                                                                   },
                                                                                                   {
                                                                                                       \"Arg9\": \"{DOMAIN_NAME}\"
                                                                                                   },
                                                                                                   {
                                                                                                       \"Arg10.$\": \"$.startDate\"
                                                                                                   },
                                                                                                   {
                                                                                                       \"Arg11.$\": \"$.startDate\"
                                                                                                   }
                                                                                               ]
                                                                                           }
                                                                                       },
                                                                                       \"ResultPath\": \"$.taskresult\",
                                                                                       \"Next\": \"Exec_Spark_Job_{JOB_ID}\"
                                                                                   },

                                                        \"Exec_Spark_Job_{JOB_ID}\": {
                                                                                   \"Type\": \"Task\",
                                                                                   \"Resource\": \"arn:aws:states:::elasticmapreduce:addStep.sync\",
                                                                                   \"Parameters\": {
                                                                                                  \"ClusterId.$\": \"$.clusterId\",                    
                                                                                                    \"Step\": {
                                                                                                       \"Name\": \"Spark_Job_{JOB_ID}\",
                                                                                                       \"ActionOnFailure\": \"CONTINUE\",
                                                                                                       \"HadoopJarStep\": {
                                                                                                           \"Jar\": \"command-runner.jar\",
                                                                                                           \"Args.$\": \"$.taskresult.StepArguments.Args[*][*]\"
                                                                                                       }
                                                                                                    }
                                                                                   },  
                                                                                   \"Retry\": [
                                                                                               {
                                                                                                   \"ErrorEquals\": [\"States.ALL\"],
                                                                                                   \"IntervalSeconds\": 10,
                                                                                                   \"MaxAttempts\": 1,
                                                                                                   \"BackoffRate\": 1.5
                                                                                               }
                                                                                           ],
                                                                                    \"Catch\": [   {
                                                                                                 \"ErrorEquals\": [\"CustomError\"],
                                                                                                 \"Next\": \"FailBranch_{GROUP_ID}\"
                                                                                               }, 
                                                                                               {
                                                                                                  \"ErrorEquals\": [\"States.ALL\"],
                                                                                                  \"Next\": \"FailBranch_{GROUP_ID}\"
                                                                                               }
                                                                                           ],

                                                                                   \"ResultPath\": \"$.taskresult\",
                                                                                   \"Next\": \"Spark_Job_{NEXT_ID}{_success}\"
                                                                               },"""


    stepEndBranch="""
                                \"SuccessBranch_{GROUP_ID}\": {
                                                \"Type\": \"Pass\",
                                                \"End\": true
                                            },"""

    stepEndBranch += """
                                \"FailBranch_{GROUP_ID}\": {
                                                    \"Type\": \"Fail\",
                                                    \"Cause\": \"Level_Error\",
                                                    \"Error\": \"Level_Error\"
                                                    }
                                            }}"""
    stepEndLevel="""],
            \"ResultPath\": \"$.ParallelOutput_{LEVEL_ID}\",
            \"OutputPath\": \"$.ParallelOutput_{LEVEL_ID}[0]\",
            \"Catch\": [{
                \"ErrorEquals\": [\"States.ALL\"],
                \"ResultPath\": \"$.ParallelOutput_{LEVEL_ID}\",
                \"Next\": \"WorkflowEnd\"
            }],
            \"Next\": \"{NEXT_LEVEL}\"
        }"""

    return startStepParallel,startStepBranch,stepJobFullTransform,stepEndBranch,stepEndLevel,stepJobFullValidator

# Function to generate step functions body based on definitions variables and data on properties files
def generateStepFunctionsBody():
    levelList = list(set(sLevels))
    levelList.sort()
    stepBody = ''
    for level in levelList:
        value=level
        groupListPerLevel=list(set([sJobsGroup[i] for i in range(0,len(sJobsGroup)) if sLevels[i]==value]))
        groupListPerLevel.sort()
        LEVEL_ID=level
        try:
            NEXT_LEVEL='Parallel Task_'+levelList[levelList.index(level)+1]
        except:
            NEXT_LEVEL='WorkflowEnd'
        stepBody+=startStepParallel.replace('{LEVEL_ID}',LEVEL_ID)
        for group in groupListPerLevel:
            # Define la lista de jobs en el grupo, y los jobs de validación posteriormente, los ordena alfabeticamente
            jobListPerGroup = [sJobsId[i] + "_" + sJobNames[i] for i in range(0, len(sJobsId)) if sJobsGroup[i] == group]
            jobListPerGroup.sort()
            valPreListPerGroup = ['V' + sJobsId[i][1:3] + "_" + sPreValidationJobs[i] for i in range(0, len(sJobsId)) if sJobsGroup[i] == group]
            valPreListPerGroup.sort()
            valPostListPerGroup = ['VP' + sJobsId[i][1:3] + "_" + sPostValidationJobs[i] for i in range(0, len(sJobsId)) if sJobsGroup[i] == group]
            valPostListPerGroup.sort()
            # Si en el csv, el primer job no tiene validacion previa, arranca por el job de spark propiamente dicho, si no arranca por la validacion
            if valPreListPerGroup[0][4:] == "":
                STARTING_JOB_ID = jobListPerGroup[0]
            else:
                STARTING_JOB_ID = valPreListPerGroup[0]
            stepBody+=startStepBranch.replace('{STARTING_JOB_ID}',STARTING_JOB_ID)
            for job in jobListPerGroup:
                stepBody = processPreValidations(valPreListPerGroup, jobListPerGroup, job, group, stepBody)
                stepBody = processTransformations(job, valPostListPerGroup, jobListPerGroup, valPreListPerGroup, stepBody, group)
                stepBody = processPostValidations(valPostListPerGroup, jobListPerGroup, job, valPreListPerGroup, stepBody, group)

            stepBody+=stepEndBranch.replace('{GROUP_ID}',group)
            if groupListPerLevel.index(group)<(len(groupListPerLevel)-1):
                stepBody+=','

        stepBody+=stepEndLevel.replace('{NEXT_LEVEL}',NEXT_LEVEL).replace('{LEVEL_ID}',LEVEL_ID)
        if NEXT_LEVEL!='WorkflowEnd':
            stepBody+=','
    return stepBody



def processPreValidations(valPreListPerGroup,jobListPerGroup,job,group,stepBody):
    ################ VALIDACIONES PRE #################
    # Genera las variables a reemplazar en el body de stepfunctions para el job de validacion previa (en el caso de que no sea vacio en el csv)
    if valPreListPerGroup[jobListPerGroup.index(job)][4:] != "":
        VALIDATION_PRE_ID = valPreListPerGroup[jobListPerGroup.index(job)]
        VALIDATION_PRE_NAME = valPreListPerGroup[jobListPerGroup.index(job)][4:]
        DOMAIN_NAME = sDomains[sJobsId.index(job.split("_")[0])]
        NEXT_JOB = job
        try:
            if valPreListPerGroup[jobListPerGroup.index(job) + 1][4:] != "":
                NEXT_FAIL_JOB = valPreListPerGroup[jobListPerGroup.index(job) + 1]
            else:
                NEXT_FAIL_JOB = jobListPerGroup[jobListPerGroup.index(job) + 1]
        except:
            NEXT_FAIL_JOB = 'FINISH{_fail}'
        # Agrega al body el bloque de job de validacion previa reemplazando las variables anteriormente definidas
        stepBody += stepJobFullValidator.replace('{JOB_ID}', VALIDATION_PRE_ID) \
            .replace('{JOB_NAME}', VALIDATION_PRE_NAME) \
            .replace('{NEXT_ID}', NEXT_JOB) \
            .replace('{NEXT_FAIL_ID}', NEXT_FAIL_JOB) \
            .replace('Spark_Job_FINISH{_fail}', 'FailBranch_' + group) \
            .replace('Spark_Job_FINISH{_success}', 'SuccessBranch_' + group) \
            .replace('{GROUP_ID}', group) \
            .replace('{_fail}', '') \
            .replace('{_success}', '') \
            .replace('{DOMAIN_NAME}', DOMAIN_NAME)
    return stepBody



def processTransformations(job,valPostListPerGroup,jobListPerGroup,valPreListPerGroup,stepBody,group):
    JOB_ID = job
    JOB_NAME = sJobNames[sJobsId.index(job.split("_")[0])]
    DOMAIN_NAME = sDomains[sJobsId.index(job.split("_")[0])]
    if valPostListPerGroup[jobListPerGroup.index(job)][5:] != "":
        NEXT_JOB = valPostListPerGroup[jobListPerGroup.index(job)]
    else:
        try:
            if valPreListPerGroup[jobListPerGroup.index(job) + 1][4:] != "":
                NEXT_JOB = valPreListPerGroup[jobListPerGroup.index(job) + 1]
            else:
                NEXT_JOB = jobListPerGroup[jobListPerGroup.index(job) + 1]
        except:
            NEXT_JOB = 'FINISH'
    try:
        if valPreListPerGroup[jobListPerGroup.index(job) + 1][4:] != "":
            NEXT_FAIL_JOB = valPreListPerGroup[jobListPerGroup.index(job) + 1]
        else:
            NEXT_FAIL_JOB = jobListPerGroup[jobListPerGroup.index(job) + 1]
    except:
        NEXT_FAIL_JOB = 'FINISH{_fail}'

    stepBody += stepJobFullTransform.replace('{JOB_ID}', JOB_ID) \
        .replace('{JOB_NAME}', JOB_NAME) \
        .replace('{NEXT_ID}', NEXT_JOB) \
        .replace('{NEXT_FAIL_ID}', NEXT_FAIL_JOB) \
        .replace('Spark_Job_FINISH{_fail}', 'FailBranch_' + group) \
        .replace('Spark_Job_FINISH{_success}', 'SuccessBranch_' + group) \
        .replace('{GROUP_ID}', group) \
        .replace('{_fail}', '') \
        .replace('{_success}', '') \
        .replace('{DOMAIN_NAME}', DOMAIN_NAME)
    return stepBody



def processPostValidations(valPostListPerGroup,jobListPerGroup,job,valPreListPerGroup,stepBody,group):
    ################ VALIDACIONES POST #################
    # Genera las variables a reemplazar en el body de stepfunctions para el job de validación posterior (en el caso de que no sea vacío en el csv)
    if valPostListPerGroup[jobListPerGroup.index(job)][5:] != "":
        VALIDATION_POST_ID = valPostListPerGroup[jobListPerGroup.index(job)]
        VALIDATION_POST_NAME = valPostListPerGroup[jobListPerGroup.index(job)][5:]
        DOMAIN_NAME = sDomains[sJobsId.index(job.split("_")[0])]
        try:
            if valPreListPerGroup[jobListPerGroup.index(job) + 1][4:] != "":
                NEXT_JOB = valPreListPerGroup[jobListPerGroup.index(job) + 1]
            else:
                NEXT_JOB = jobListPerGroup[jobListPerGroup.index(job) + 1]
        except:
            NEXT_JOB = 'FINISH'
        try:
            if valPreListPerGroup[jobListPerGroup.index(job) + 1][4:] != "":
                NEXT_FAIL_JOB = valPreListPerGroup[jobListPerGroup.index(job) + 1]
            else:
                NEXT_FAIL_JOB = jobListPerGroup[jobListPerGroup.index(job) + 1]
        except:
            NEXT_FAIL_JOB = 'FINISH{_fail}'
            # Agrega al body el bloque de job de validación posterior reemplazando las variables anteriormente definidas
        stepBody += stepJobFullValidator.replace('{JOB_ID}', VALIDATION_POST_ID) \
            .replace('{JOB_NAME}', VALIDATION_POST_NAME) \
            .replace('{NEXT_ID}', NEXT_JOB) \
            .replace('{NEXT_FAIL_ID}', NEXT_FAIL_JOB) \
            .replace('Spark_Job_FINISH{_fail}', 'FailBranch_' + group) \
            .replace('Spark_Job_FINISH{_success}', 'SuccessBranch_' + group) \
            .replace('{GROUP_ID}', group) \
            .replace('{_fail}', '') \
            .replace('{_success}', '') \
            .replace('{DOMAIN_NAME}', DOMAIN_NAME)
    return stepBody




# Function to write on output file
def writeStepOut():
    try:
        fileOut = open(outputFile, "w")
        fileOut.write(stepFunction)
        fileOut.close()
    except Exception as err:
        print('Error writing on output file: ' + str(type(err)))
        print(err)


#MAIN
usage(2)
jobsFile,outputFile=setFiles()
sJobsId,sJobNames,sJobsGroup,sLevels,sDomains,sPreValidationJobs,sPostValidationJobs=readJobsProperties(jobsFile)
stepStart,stepEnd=setStepFunctionsStartAndEnd()
startStepParallel,startStepBranch,stepJobFullTransform,stepEndBranch,stepEndLevel,stepJobFullValidator=setStepFunctionsChains()
stepBody=generateStepFunctionsBody()
stepFunction=stepStart+stepBody+stepEnd
writeStepOut()
