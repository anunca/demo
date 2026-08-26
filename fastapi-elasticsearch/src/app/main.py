from fastapi import FastAPI
from app.controller import health_controller
from app.controller import elastic_controller
from app.controller import local_parameter_controller

app = FastAPI()
api_version = '/api/v1'

app.include_router(health_controller.router, prefix="/health")
app.include_router(elastic_controller.router, prefix="/elastic")
app.include_router(local_parameter_controller.router, prefix=f"{api_version}/local-parameter")
