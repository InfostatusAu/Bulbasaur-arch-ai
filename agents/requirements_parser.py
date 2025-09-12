def parse_requirements(raw_text: str):
    """
    Stub for requirements parser.
    Replace with LLM call + JSON validation.
    """
    return {
        "functional": ["user login", "data ingestion"],
        "nonfunctional": {
            "availability": "99.9%",
            "latency_ms_p95": 200,
        },
        "constraints": ["must_use_aws"],
        "stakeholders": [{"name": "Alice", "role": "CTO"}],
        "assumptions": ["users ~10k"]
    }
