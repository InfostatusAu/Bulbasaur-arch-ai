def make_plan(selected_variant: dict):
    return {
        "sprints": [
            {"name": "Sprint 1", "tasks": ["Setup VPC", "Configure IAM"]},
            {"name": "Sprint 2", "tasks": ["Deploy API", "Deploy DB"]},
        ],
        "resources": {"devops": 2, "backend": 3},
    }
