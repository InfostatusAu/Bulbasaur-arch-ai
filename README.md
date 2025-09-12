# 🐲 Bulbasaur MCP Server

The **Bulbasaur MCP Server** is a FastAPI-based application that demonstrates **AI-assisted solution architecture**.  
It enables teams to gather requirements, analyze client needs, synthesize solution variants, validate against best practices, and generate documentation.  

---

## 🚀 Features
- 📋 Create & manage solution projects  
- 🔎 Analyze requirements  
- 🏗️ Synthesize multiple solution variants  
- ✅ Validate solutions against constraints  
- 📑 Auto-generate architecture documentation  

---

## 📂 Project Structure
bulbasaur-arch-ai/
│── main.py
│── requirements.txt
│
├── routers/
│   │── __init__.py
│   │── validate.py
│   │── analyze.py     # (optional, for your analyze endpoint)
│
├── models/            # (optional, if you want to separate Pydantic models)
│   │── __init__.py
│   │── validation.py
│
├── tests/             # (optional, for pytest unit tests)
│   │── __init__.py
│   │── test_validate.py
│
├── venv/              # your Python virtual environment
│   └── ...


---

## ⚙️ Setup Instructions

### 1. Clone Repository
```bash
git clone <your-repo-url>
cd bulbasaur-arch-ai

2. Create Virtual Environment
python3 -m venv venv
source venv/bin/activate

3. Install Dependencies
pip install -r requirements.txt

4. Run Server
uvicorn mcp_server.main:app --reload --port 8001
Server will be available at:
👉 http://127.0.0.1:8001

Swagger UI:
👉 http://127.0.0.1:8001/docs

📡 API Endpoints

(A) Create Project
POST /projects/

Body:
{
  "name": "AI Architecture Project",
  "description": "Design intelligent architecture"
}
➡️ Returns project_id (use it in the next steps).

(B) Analyze Project
POST /analyze/{project_id}

Body:
{
  "requirements": ["Scalable", "Secure", "Low cost"]
}
(C) Synthesize Solutions
POST /synthesize/{project_id}
{
  "options": ["cloud-native", "on-prem"]
}
➡️ Returns variant_ids (save them for validation).
(D) Validate Solution

POST /validate/{project_id}

Body:
{
  "variant_ids": ["v1-cost"]
}

🛠️ Common Issues & Fixes

❌ Swagger UI not loading → Check port (--port 8001).

❌ Server not starting → Wrong path. Use:
uvicorn mcp_server.main:app --reload --port 8001

❌ Validation endpoint not found → Fixed double prefix with @router.post("/{project_id}").

❌ Validation bad request → Schema updated to variant_ids: List[str].

📌 Notes

Runs locally inside Python virtual environment.

👨‍💻 Team Bulbasaur – Intelligent Solution Architecture

---

✅ Next step for you:  

1. Create `README.md` file in your repo root.  
2. Paste the content above.  
3. Commit & push:  

```bash
git add README.md
git commit -m "Add project README"
git push origin main
