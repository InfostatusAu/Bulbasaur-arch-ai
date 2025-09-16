from fastapi import APIRouter
from pydantic import BaseModel
from typing import List

router = APIRouter()

class ValidationRequest(BaseModel):
    variant_ids: List[str]

@router.post("/{project_id}")
async def validate_solution(project_id: str, request: ValidationRequest):

    return {
        "status": "ok",
        "project_id": project_id,
        "validated": request.variant_ids
    }
