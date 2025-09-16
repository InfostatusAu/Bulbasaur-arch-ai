#!/bin/bash
set -euo pipefail

# Activate venv
source venv/bin/activate

# Install dependencies
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt

# Start server
PORT=8001
echo "🚀 Starting MCP server on http://127.0.0.1:${PORT}/docs"
uvicorn mcp_server.main:app --reload --port $PORT &

SERVER_PID=$!

# Wait until /docs is available (HTTP 200)
echo "⏳ Waiting for server..."
until curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:${PORT}/docs | grep -q "200"; do
  sleep 1
done

echo "✅ Server is live!"

# Open docs in default browser (MacOS)
open "http://127.0.0.1:${PORT}/docs"

# Keep server running
wait $SERVER_PID
#!/bin/bash
set -euo pipefail

# Activate venv
source venv/bin/activate

# Install dependencies
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt

# Start server
PORT=8001
echo "🚀 Starting MCP server on http://127.0.0.1:${PORT}/docs"
uvicorn mcp_server.main:app --reload --port $PORT &

SERVER_PID=$!

# Wait until /docs is available (HTTP 200)
echo "⏳ Waiting for server..."
until curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:${PORT}/docs | grep -q "200"; do
  sleep 1
done

echo "✅ Server is live!"

# Open docs in browser
open "http://127.0.0.1:${PORT}/docs"

# Keep server running
wait $SERVER_PID
