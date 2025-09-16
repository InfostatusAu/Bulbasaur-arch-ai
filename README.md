🌱 Bulbasaur MCP Server

A lightweight FastAPI-based MCP (Model-Driven Control Plane) server for project lifecycle management:

📦 Create projects

🔎 Analyze

🧩 Synthesize

🔐 Validate

Swagger UI is automatically opened when the server starts.

🚀 Features

REST API built with FastAPI

Auto-generated Swagger UI at /docs

Simple scripts for starting and testing

Health check endpoint (/health)

📂 Project Structure
.
├── mcp_server/         # FastAPI app (main.py, routes, models, etc.)
├── run.sh              # Start server & auto-open Swagger UI
├── run-mcp.sh          # Run MCP-specific workflows
├── test_mcp.sh         # Test full MCP workflow
├── requirements.txt    # Python dependencies
├── README.md           # This file
├── tests/              # Unit/integration tests (optional)
├── docker-compose.yml  # Dockerized deployment (optional)
├── knowledge_base/     # Knowledge resources (optional)
├── agents/             # AI agents logic (optional)
├── artifacts/          # Generated outputs (optional)
├── templates/          # Web templates if used (optional)


✅ Minimum needed to run:

mcp_server/
requirements.txt
run.sh


➕ For full dev/test flow:

README.md
run-mcp.sh
test_mcp.sh
tests/
pytest.ini

⚡ Quick Start
# 1. Clone repo
git clone <your-repo-url>
cd bulbasaur-mcp

# 2. Create & activate virtual environment
python3 -m venv venv
source venv/bin/activate   # Mac/Linux
venv\Scripts\activate      # Windows

# 3. Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

# 4. Run server 🎉
./run.sh


👉 This will:

Kill any process on port 8001

Start the FastAPI server

Auto-open Swagger UI at http://127.0.0.1:8001/docs

🌐 Working with Swagger UI & IDs

When the server is running, open Swagger UI (/docs) to interact with endpoints:

1. Create Project

Endpoint: POST /projects/create

Example body:

{
  "name": "My Project",
  "description": "Testing via Swagger UI"
}


Response:

{"project_id": "123e4567-e89b-12d3-a456-426614174000"}

2. Analyze Project

Endpoint: POST /analyze/{project_id}

Paste your project_id

3. Synthesize Project

Endpoint: POST /synthesize/{project_id}

Use the same project_id

4. Validate Project

Endpoint: POST /validate/{project_id}

Example body:

{
  "requirements": ["scalability", "security", "performance"]
}

5. Health Check

Endpoint: GET /health

Response:

{"status": "ok"}

🧪 CLI Testing

Instead of Swagger, you can run the automated flow:

./test_mcp.sh


This will:
✅ Create → Analyze → Synthesize → Validate

🛑 Stopping the Server

If port 8001 is busy, kill the process:

lsof -ti:8001 | xargs kill -9