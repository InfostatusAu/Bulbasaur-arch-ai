from fastapi import FastAPI
from mcp_server.routes import projects, analyze, synthesize, validate

app = FastAPI(title="Bulbasaur MCP Server")

# Routers
app.include_router(projects.router, prefix="/projects", tags=["projects"])
app.include_router(analyze.router, prefix="/analyze", tags=["analyze"])
app.include_router(synthesize.router, prefix="/synthesize", tags=["synthesize"])
app.include_router(validate.router, prefix="/validate", tags=["validate"])

@app.get("/")
def root():
    return {"msg": "Bulbasaur MCP Server running"}
