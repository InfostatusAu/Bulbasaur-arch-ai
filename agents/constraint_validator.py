def validate_architecture(variant: dict):
    """
    Stub: validate against simple rules.
    """
    results = []
    if "RDS" in str(variant["components"]):
        results.append({"rule": "encryption", "status": "PASS"})
    else:
        results.append({"rule": "database_encryption", "status": "FAIL", "explanation": "No encrypted DB"})
    
    return {"variant_id": variant["id"], "results": results, "overall_status": "PASS" if all(r["status"]=="PASS" for r in results) else "FAIL"}
