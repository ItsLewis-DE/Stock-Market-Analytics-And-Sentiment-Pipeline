basic_cosmos_dag = DbtDag(
        project_config = ProjectConfig(DBT_PROJECT_PATH)
        profile_config = profile_config
        operator_args = {
            "install_deps":True
        },
        schedule = "@daily"
        start_date = datetime(2023,1,1)
        catchup=False
        dag_id = "dbt_dag"
        default_args = {"retries":1}
)