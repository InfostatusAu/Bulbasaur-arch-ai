from fastapi import APIRouter
from agents.requirements_parser import parse_requirements

router = APIRouter()

@router.post("/{project_id}")
def analyze(project_id: int, text: str):
    parsed = parse_requirements(text)
    return {"project_id": project_id, "requirements": parsed}
