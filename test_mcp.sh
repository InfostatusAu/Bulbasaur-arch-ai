#!/bin/bash
set -euo pipefail

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${CYAN}🧪 Testing Bulbasaur MCP API...${NC}"

BASE_URL="http://127.0.0.1:8001"

# Step 1: Create project
echo -e "${YELLOW}📦 Creating project...${NC}"
CREATE_RESPONSE=$(curl -s -X POST "$BASE_URL/projects/create" \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Project", "description": "Testing MCP flow"}')

echo "Response: $CREATE_RESPONSE"

PROJECT_ID=$(echo "$CREATE_RESPONSE" | jq -r '.project_id')

if [ "$PROJECT_ID" == "null" ] || [ -z "$PROJECT_ID" ]; then
    echo -e "${RED}❌ Failed to extract project_id${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Project created with ID: $PROJECT_ID${NC}"

# Step 2: Analyze project
echo -e "${YELLOW}🔎 Analyzing project...${NC}"
ANALYZE_RESPONSE=$(curl -s -X POST "$BASE_URL/analyze/$PROJECT_ID")
echo "Response: $ANALYZE_RESPONSE"

if [[ "$ANALYZE_RESPONSE" == *"error"* ]]; then
    echo -e "${RED}❌ Analyze step failed${NC}"
    exit 1
else
    echo -e "${GREEN}✅ Analyze step completed${NC}"
fi

# Step 3: Synthesize project
echo -e "${YELLOW}🧩 Synthesizing project...${NC}"
SYNTH_RESPONSE=$(curl -s -X POST "$BASE_URL/synthesize/$PROJECT_ID")
echo "Response: $SYNTH_RESPONSE"

if [[ "$SYNTH_RESPONSE" == *"error"* ]]; then
    echo -e "${RED}❌ Synthesize step failed${NC}"
    exit 1
else
    echo -e "${GREEN}✅ Synthesize step completed${NC}"
fi

# Step 4: Validate solution
echo -e "${YELLOW}🔐 Validating project...${NC}"
VALIDATE_RESPONSE=$(curl -s -X POST "$BASE_URL/validate/$PROJECT_ID" \
  -H "Content-Type: application/json" \
  -d '{"requirements": ["scalability","security","performance"]}')
echo "Response: $VALIDATE_RESPONSE"

if [[ "$VALIDATE_RESPONSE" == *"error"* ]]; then
    echo -e "${RED}❌ Validation failed${NC}"
    exit 1
else
    echo -e "${GREEN}✅ Validation step completed${NC}"
fi

echo -e "${GREEN}🎉 MCP flow test completed successfully!${NC}"
