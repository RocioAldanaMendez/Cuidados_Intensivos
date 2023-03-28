from auth import ACCESS_KEY, SECRET_KEY
from airflow import DAG
from datetime import datetime, timedelta
from airflow.operators.python_operator import PythonOperator
import boto3


default_args = {
    'owner': 'Airflow',
    'start_date': datetime(2023, 3, 22),
    'retries': 1,
    'retry_delay': timedelta(seconds=5)
}

def pushS3():
    ''' pushing data to S3 bucket'''
    client = boto3.client('s3', aws_access_key_id=ACCESS_KEY, aws_secret_access_key=SECRET_KEY)
    client.create_bucket(Bucket='medinova')
    
    filepaths = ["/usr/local/airflow/dags/Admissions_prueba.csv", 
                 "/usr/local/airflow/dags/Chartevents_prueba.csv",
                 "/usr/local/airflow/dags/Labevents_prueba.csv",
                 "/usr/local/airflow/dags/Patients_prueba.csv",
                 "/usr/local/airflow/dags/Prescriptions_prueba.csv",
                 "/usr/local/airflow/dags/selected_2.csv"]
    
    for filepath in filepaths:
        filename = filepath.split("/")[-1]
        with open(filepath, "rb") as f:
            client.upload_fileobj(f, "medinova", filename)

    print("Upload Completed")

with DAG("Carga_de_archivos", default_args=default_args, schedule_interval="@daily", catchup=False) as dag:
    t1 = PythonOperator(task_id="S3-Using-Python", python_callable=pushS3)
