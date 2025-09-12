from fastapi import APIRouter
from agents.architect_agent import generate_architectures

router = APIRouter()

@router.post("/{project_id}")
def synthesize(project_id: int, requirements: dict):
    variants = generate_architectures(requirements)
    return {"project_id": project_id, "variants": variants}
