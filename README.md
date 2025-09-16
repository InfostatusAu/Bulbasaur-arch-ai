🐲 Bulbasaur MCP Server

The Bulbasaur MCP Server is a FastAPI-based application that demonstrates AI-assisted solution architecture.
It helps teams gather requirements, analyze client needs, generate solution variants, validate against best practices, and produce architecture documentation.

🚀 Features

📋 Create & manage solution projects

🔎 Analyze requirements

🏗️ Synthesize multiple solution variants

✅ Validate solutions against constraints

📑 Auto-generate architecture documentation

🌐 Interactive API docs via Swagger

📂 Repository Structure
bulbasaur-arch-ai/
│── README.md
│── requirements.txt
│
└── mcp_server/
    ├── main.py          # Entry point (FastAPI app)
    ├── routes/
    │   ├── projects.py  # Project management endpoints
    │   ├── analyze.py   # Analyse solution requirements
    │   ├── synthesize.py # Generate architectures
    │   └── validate.py  # Validate architecture designs

⚙️ Setup Instructions
1. Clone Repository
git clone https://github.com/<your-username>/bulbasaur-arch-ai.git
cd bulbasaur-arch-ai

2. Create Virtual Environment
python3 -m venv venv
source venv/bin/activate   # (Linux/Mac)
venv\Scripts\activate      # (Windows)

3. Install Dependencies
pip install -r requirements.txt

4. Run Server
uvicorn mcp_server.main:app --reload --port 8001


👉 Server available at:

API root: http://127.0.0.1:8001

Swagger UI: http://127.0.0.1:8001/docs

📡 API Endpoints
1. Root
curl http://127.0.0.1:8001/


✅ Response:

{"msg": "Bulbasaur MCP Server running"}

2. Create Project
POST /projects/
{
  "name": "AI Architecture Project",
  "description": "Design intelligent architecture"
}


➡️ Returns project_id

3. Analyze Project
POST /analyze/{project_id}
{
  "requirements": ["Scalable", "Secure", "Low cost"]
}

4. Synthesize Solutions
POST /synthesize/{project_id}
{
  "options": ["cloud-native", "on-prem"]
}


➡️ Returns variant_ids

5. Validate Solution
POST /validate/{project_id}
{
  "variant_ids": ["v1-cost"]
}

🛠️ Common Issues & Fixes

❌ Swagger UI not loading → check port (--port 8001)

❌ Server not starting → ensure path:

uvicorn mcp_server.main:app --reload --port 8001


❌ Validation errors → ensure request body includes "variant_ids": List[str]

🎯 Results

✅ Challenge 1 goal achieved: MCP server prototype completed

✅ Endpoints for projects, analyse, synthesize, validate working

✅ Forms the foundation for Challenge 2 (containerized microservices + orchestrator)
