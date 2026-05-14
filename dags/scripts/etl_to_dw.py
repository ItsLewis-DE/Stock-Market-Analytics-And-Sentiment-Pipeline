from airflow.sdk import DAG
from airflow.operators.python import PythonOperator
import json
import pendulum
from dags.elt.extract.extract_news import extract_news
default_args = {
    "owner" : 'phongthanh',
}

with DAG (
    dag_id='Extracing_API_and_load_data_data_warehouse',
    default_args = default_args,
    schedule = '0 0 1 * *',
    start_date = pendulum.datetime(2025,1,1,tz='Asia/Ho_Chi_Minh'),
    catchup = False
) as dag:
    extract_news_task = PythonOperator(
        task_id = 'extract_news_task',
        python_callable = extract_news
    )