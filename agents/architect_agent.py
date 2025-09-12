def generate_architectures(requirements: dict):
    """
    Stub: picks 2 variants from pattern library.
    """
    return [
        {
            "id": "v1-cost",
            "summary": "Cost-optimized serverless",
            "components": ["API Gateway", "Lambda", "S3", "DynamoDB"],
            "plantuml": "@startuml\nactor User\nUser -> API\n@enduml",
            "estimated_cost": {"monthly_usd": 1200},
            "risk_score": 0.3,
        },
        {
            "id": "v2-ha",
            "summary": "Highly available microservices",
            "components": ["ALB", "ECS", "RDS Multi-AZ", "ElastiCache"],
            "plantuml": "@startuml\nactor User\nUser -> ALB\n@enduml",
            "estimated_cost": {"monthly_usd": 4000},
            "risk_score": 0.6,
        },
    ]
