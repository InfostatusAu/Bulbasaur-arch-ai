from fastapi import APIRouter
from pydantic import BaseModel
from typing import List

router = APIRouter()

class ProjectCreate(BaseModel):
    name: str
    description: str

projects_db = {}

@router.post("/create")
def create_project(payload: ProjectCreate):
    pid = len(projects_db) + 1
    projects_db[pid] = payload.dict()
    return {"project_id": pid, "status": "created"}
