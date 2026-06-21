from fastapi import APIRouter
from app.service.elastic_service import ElasticService

router = APIRouter()
elastic_service = ElasticService()

@router.get("/")
def show_index():
    return elastic_service.show_index()

@router.put("/")
def create_index():
    response = elastic_service.create_index()
    return {"message": response}

@router.delete("/")
def delete_index():
    response = elastic_service.delete_index()
    return {"message": response}
