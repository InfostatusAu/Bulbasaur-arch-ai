#!/bin/bash

# Kill anything already running on port 8001
lsof -ti:8001 | xargs kill -9 2>/dev/null

# Activate virtual environment
source venv/bin/activate

# Start the FastAPI server and open Swagger docs
uvicorn mcp_server.main:app --reload --port 8001 &

# Wait a bit for server to start
sleep 2

# Open Swagger docs in browser (MacOS: open, Linux: xdg-open, Windows: start)
open http://127.0.0.1:8001/docs