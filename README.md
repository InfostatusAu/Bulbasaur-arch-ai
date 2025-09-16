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

Scripts for easy server start and testing

Health check endpoint (/health)

📂 Project Structure

✅ Required to run the MCP server

mcp_server/ → your FastAPI app (main.py, routes, models, etc.)

requirements.txt → Python dependencies

run.sh → script to start the server (with auto-open Swagger UI)

run-mcp.sh → script to run MCP-specific workflows

📖 Documentation

README.md → project instructions (keep this)

🧪 For testing (optional, but useful)

tests/ → your unit/integration tests

pytest.ini → test runner config

test_mcp.sh → script to run MCP test flow

🗂️ Optional / Support files

knowledge_base/ → custom knowledge resources (keep if you’re using it)

agents/ → AI agents logic (keep if you need them)

bulbasaur-lifecycle-platform/ → seems like part of your architecture, keep if connected

artifacts/ → generated outputs (not required to run server)

templates/ → FastAPI/Jinja templates if you use web rendering

🐳 For containers (optional)

docker-compose.yml → only needed if you want Dockerized deployment

⚙️ Other environment/config

.env.example → sample env vars (keep as reference)

.gitignore → for Git (optional, but useful)

venv/ → local virtual environment (not tracked in Git, only local)

server.log → runtime logs (safe to delete, auto-regenerated)

.pytest_cache/ → cache, can be deleted safely

✅ So the minimum you need to run the server is:

mcp_server/
requirements.txt
run.sh


➕ If you want full dev/test flow:

README.md
run-mcp.sh
test_mcp.sh
tests/
pytest.ini

⚡ Quick Start
1. Clone repo and enter folder
git clone <your-repo-url>
cd bulbasaur-mcp

2. Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate   # Mac/Linux
venv\Scripts\activate      # Windows (PowerShell)

3. Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

4. Start server with one command 🎉
./run.sh


This will:

Kill any process using port 8001

Start the FastAPI server

Auto-open Swagger UI at 👉 http://127.0.0.1:8001/docs

🌐 Working with the API via URL

When the server is running, you can interact with it either:

Through the Swagger UI at http://127.0.0.1:8001/docs

Or by calling the API endpoints directly.

1. Create a Project
curl -X POST http://127.0.0.1:8001/projects/create \
  -H "Content-Type: application/json" \
  -d '{"name": "My Project", "description": "First test project"}'


✅ Response:

{"project_id": "123e4567-e89b-12d3-a456-426614174000"}

2. Analyze the Project

Use the project_id returned from create:

curl -X POST http://127.0.0.1:8001/analyze/<project_id>

3. Synthesize the Project
curl -X POST http://127.0.0.1:8001/synthesize/<project_id>

4. Validate the Project

Provide requirements when validating:

curl -X POST http://127.0.0.1:8001/validate/<project_id> \
  -H "Content-Type: application/json" \
  -d '{"requirements": ["scalability","security","performance"]}'

5. Health Check
curl http://127.0.0.1:8001/health


Expected:

{"status": "ok"}

🧪 Testing Workflow Automatically

Run the full test:

./test_mcp.sh


This script will:

Create a project

Analyze it

Synthesize it

Validate it

🛑 Stopping the Server

Kill the process running on port 8001:

lsof -ti:8001 | xargs kill -9


👉 Now you can either play with the Swagger UI by filling in values, or copy the project_id from create and use it in analyze, synthesize, and validate calls.

Do you want me to also add example screenshots of the Swagger UI filled with IDs (like how to paste the project_id into each request) into the README? That way you’ll have both curl + visual guidance.

Here’s your updated README.md with a new section on how to use the URL page and all IDs directly:

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

Scripts for easy server start and testing

Health check endpoint (/health)

📂 Project Structure
.
├── mcp_server/
│   ├── main.py        # FastAPI entrypoint
│   ├── routes/        # API endpoints
│   └── models/        # Pydantic models
├── run.sh             # Start server & auto-open docs
├── test_mcp.sh        # Test full MCP workflow
├── requirements.txt   # Python dependencies
└── README.md

⚡ Quick Start
git clone <your-repo-url>
cd bulbasaur-mcp
python3 -m venv venv
source venv/bin/activate   # Mac/Linux
venv\Scripts\activate      # Windows
pip install --upgrade pip
pip install -r requirements.txt
./run.sh


👉 This will auto-open Swagger UI at:
http://127.0.0.1:8001/docs

🌐 Working with Swagger UI & IDs

When you open /docs, you’ll see all endpoints.

1. Create Project

Go to POST /projects/create

Fill in JSON body:

{
  "name": "My Project",
  "description": "Testing via Swagger UI"
}


Execute → Copy the returned project_id

2. Analyze Project

Go to POST /analyze/{project_id}

Paste the project_id into the path parameter

Execute → You’ll get analysis results

3. Synthesize Project

Go to POST /synthesize/{project_id}

Paste the same project_id

Execute → You’ll get synthesized output

4. Validate Project

Go to POST /validate/{project_id}

Paste the same project_id

Fill in body:

{
  "requirements": ["scalability", "security", "performance"]
}


Execute → You’ll see validation results

5. Health Check

Open GET /health

Execute → Response:

{"status": "ok"}

🧪 CLI Testing

Instead of Swagger, you can also run:

./test_mcp.sh


It will automatically create → analyze → synthesize → validate.

🛑 Stop the Server
lsof -ti:8001 | xargs kill -9
