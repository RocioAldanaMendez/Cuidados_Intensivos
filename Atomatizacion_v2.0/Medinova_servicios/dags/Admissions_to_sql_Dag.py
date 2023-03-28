from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta
import pandas as pd
import boto3
from sqlalchemy import create_engine
from auth import ACCESS_KEY,SECRET_KEY
from airflow.models.connection import Connection
            


default_args = {
    'owner': 'Airflow',
    'depends_on_past': False,
    'start_date': datetime(2023, 3, 22),
    'retries': 1,
    'retry_delay': timedelta(seconds=5),
}

dag = DAG(
    'Admissions_to_sql',
    default_args=default_args,
    schedule_interval=timedelta(days=1),
    catchup=False
)

s3_bucket_name = 'medinova'
s3_object_key = 'Admissions_prueba.csv'
mysql_table_name = 'datawarehouse.Admissions'

def read_csv_from_s3():
    try:
        s3 = boto3.client('s3', aws_access_key_id=ACCESS_KEY,
                          aws_secret_access_key=SECRET_KEY)
        obj = s3.get_object(Bucket=s3_bucket_name, Key=s3_object_key)
        df = pd.read_csv(obj['Body'])
        df["deathtime"].fillna("1900-01-01 00:00:00", inplace=True)
       
        return df

    except NoCredentialsError:
        print('Error: Credenciales de AWS no encontradas')




def load_data_to_mysql():
    # Crea la conexión a la base de datos de MySQL utilizando la librería SQLAlchemy
    engine = create_engine('mysql+pymysql://admin:adminadmin@datawarehouse.c0bmuj6s8uhs.us-east-2.rds.amazonaws.com:3306/datawarehouse')

    # Carga los datos transformados en la tabla de MySQL
    df = read_csv_from_s3()
    df.to_sql(name=mysql_table_name, con=engine, if_exists='append', index=False)

python_operator = PythonOperator(
    task_id='s3_to_mysql',
    python_callable=load_data_to_mysql,
    dag=dag
)