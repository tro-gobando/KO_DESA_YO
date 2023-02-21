###############################################################################################################################
#    Lambda que lee guarda un registro en una tabla de DynamoDB para hacer el lod de carga para Incomm
# DESCRIPTION   : Esta lambda genera un registro nuevo en una tabla de DynamoDB ("incomm_log_event") cada vez que se realiza 
#                 una ingesta nueva, manteniendo un log de carga.
# AUTOR         : Guillermo Obando
# CHANGES       :
# VER.  DATE            AUTHOR                      COMMENTS
# -----------------------------------------------------------------------------------------------------------------------------
# 1.0   2023/01/17     Guillermo Obando            Version 1.0.
# -----------------------------------------------------------------------------------------------------------------------------
###############################################################################################################################


import boto3
import json
import os
from datetime import date
from datetime import datetime
import uuid

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table("incomm_log_event")

def lambda_handler(event, context):

    Load_timestamp = datetime.now() # current date and time
    id = uuid.uuid4().hex
    s3_object_name  = str(event['Records'][0]['s3']['object']['key'].encode('utf8')).replace("b'","").replace("'","")
    S3_bucket      = event['Records'][0]['s3']['bucket']['name']
    S3_ing_file = os.path.basename(s3_object_name)
    S3_folder = str(s3_object_name).split("/")[-2]
    date = Load_timestamp.strftime("%d-%m-%Y, %H:%M:%S")
    dDay    = Load_timestamp.strftime("%d")
    dMonth  = Load_timestamp.strftime("%m")
    dYear   = Load_timestamp.strftime("%Y")

    print("id", id,
          "| s3_object_name:", s3_object_name, 
          "| S3_bucket:", S3_bucket, 
          "| S3_ing_file:", S3_ing_file, 
          "| S3_folder:", S3_folder,
          "| Load_timestamp:", date, 
          "| dDay:", dDay, 
          "| dMonth:", dMonth, 
          "| dYear:", dYear) 

    table.put_item(
    	Item = {
    	      "id"              : id,
              "s3_object_name:" : s3_object_name, 
              "S3_bucket:"      : S3_bucket, 
              "S3_ing_file:"    : S3_ing_file, 
              "S3_folder:"      : S3_folder,
              "Load_timestamp:" : date, 
              "dDay:"           : dDay, 
              "dMonth:"         : dMonth, 
              "dYear:"          : dYear
    		}
    	)
