from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)
api_version = '/api/v1'

def test_patch_success():
    personal_parameter = """
        <PERSONALPARAMS>
          <THEME>
            <PARAM NAME="LIST_QUERY_GRID_LINE">
              <DEFAULT>20</DEFAULT>
            </PARAM>
            <PARAM NAME="BLOCK_GRID_LINE">
              <DEFAULT>5</DEFAULT>
            </PARAM>
            <PARAM NAME="DLG_HISTORY_GRID_SETTINGS">
              <DEFAULT>ALL_ACTION_TYPES</DEFAULT>
            </PARAM>
          </THEME>
        </PERSONALPARAMS>
        """.strip()

    payload = {
        "tenant_id": "tenant123",
        "guid": "abc-456-def",
        "personal_parameters": personal_parameter
    }

    response = client.patch(f"{api_version}/local-parameter", json=payload)
    assert response.status_code == 200
