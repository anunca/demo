from fastapi import APIRouter, HTTPException, BackgroundTasks
from fastapi.responses import JSONResponse
from app.model.local_parameter_model import LocalParameter
from app.service.xml_service import XMLService
from app.service.elastic_service import ElasticService

router = APIRouter()

@router.patch("/")
async def upsert(data: LocalParameter, background_tasks: BackgroundTasks)-> JSONResponse:
    """Patch (upsert local-parameter data).

    Args:
        data (LocalParameter): The data to upsert.

    Returns:
        JSONResponse: The JSON response.

    Raises:
        HTTPException: If parsed XML to dict or ElasticService upsert has an error.
    """
    try:
        parsed_xml = XMLService().parse_to_dict(data.personal_parameters)

        local_parameter = {
            "tenant_id": data.tenant_id,
            "guid": data.guid,
            "personal_parameters": parsed_xml
        }
        background_tasks.add_task(ElasticService().upsert, local_parameter)
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

    return {"message": f"enqueue upsert with id {data.guid}"}
