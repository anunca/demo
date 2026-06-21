from fastapi import APIRouter, HTTPException
from fastapi.responses import JSONResponse

router = APIRouter()

@router.get("/")
def check()-> JSONResponse:
    """Health check endpoint.
    Returns:
        JSONResponse: The JSON response indicating the health status.
    """
    return JSONResponse(status_code=200, content={"status": "ok"})
