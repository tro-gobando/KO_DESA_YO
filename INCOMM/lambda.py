import boto3
import json
import os
from datetime import date
from datetime import datetime

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table("test")

def lambda_handler(event, context):
    # print(event)
    # object_key=str(event['Records'][0])
    Load_timestamp = datetime.now() # current date and time
    pk          = str(event['Records'][0]['s3']['object']['key'].encode('utf8')).replace("b'","").replace("'","") + " | " +Load_timestamp.strftime("%m/%d/%Y, %H:%M:%S")
    s3_object_name  = str(event['Records'][0]['s3']['object']['key'].encode('utf8')).replace("b'","").replace("'","")
    S3_bucket      = event['Records'][0]['s3']['bucket']['name']
    S3_ing_file = os.path.basename(s3_object_name)
    S3_folder = str(s3_object_name).split("/")[-2]
    # # curr_date = date.today()
    # # curr_date   = datetime.now()
    dDay    = Load_timestamp.strftime("%d")
    dMonth  = Load_timestamp.strftime("%m")
    dYear   = Load_timestamp.strftime("%Y")

    print("pk", pk,
          "| s3_object_name:", s3_object_name, 
          "| S3_bucket:", S3_bucket, 
          "| S3_ing_file:", S3_ing_file, 
          "| S3_folder:", S3_folder,
          "| Load_timestamp:", Load_timestamp, 
          "| dDay:", dDay, 
          "| dMonth:", dMonth, 
          "| dYear:", dYear) 

    table.put_item(
    	Item = {
    	      "pk"              : pk,
              "s3_object_name:" : s3_object_name, 
              "S3_bucket:"      : S3_bucket, 
              "S3_ing_file:"    : S3_ing_file, 
              "S3_folder:"      : S3_folder,
              "Load_timestamp:" : Load_timestamp, 
              "dDay:"           : dDay, 
              "dMonth:"         : dMonth, 
              "dYear:"          : dYear
    		}
    	)




"pk": "data/distr_chan_text/distr_chan_text.csv | 2023-01-28 00:00:00 00000",
"S3_object_name:": "data/distr_chan_text/distr_chan_text.csv", 
"S3_bucket:": "xtract-incomm-commissions-dev", 
"S3_ing_file:": "distr_chan_text.csv", 
"S3_folder:": "distr_chan_text",
"Load_timestamp:": "2023-01-28 00:00:00.000000", 
"dDay:": "28", 
"dMonth:": "01", 
"dYear:": "2023"