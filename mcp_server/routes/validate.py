from fastapi import APIRouter
from agents.constraint_validator import validate_architecture

router = APIRouter()

@router.post("/{project_id}")
def validate(project_id: int, variant: dict):
    results = validate_architecture(variant)
    return {"project_id": project_id, "validation": results}
