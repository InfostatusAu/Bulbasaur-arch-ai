# Bulbasaur – Intelligent Solution Architecture

This project implements an AI-assisted **technical solution design system**.

It provides:
- An **MCP server** (FastAPI) to orchestrate workflows
- **Agents** to parse requirements, design architectures, validate them, plan implementation, and estimate costs
- **Knowledge base** of patterns, best practices, compliance rules
- **Templates** for reports and Terraform scaffolds
- **Artifacts** (generated diagrams, reports, Terraform, logs)

## Quick Start

```bash
# Clone
git clone https://github.com/your-org/bulbasaur-arch-ai.git
cd bulbasaur-arch-ai

# Install deps
pip install -r requirements.txt

# Run locally
uvicorn mcp_server.main:app --reload
