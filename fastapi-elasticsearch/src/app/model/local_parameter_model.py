from pydantic import BaseModel

class LocalParameter(BaseModel):
    tenant_id: str
    guid: str
    personal_parameters: str  # XML string
