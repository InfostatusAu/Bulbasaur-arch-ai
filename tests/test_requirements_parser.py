from agents.requirements_parser import parse_requirements

def test_parser_basic():
    result = parse_requirements("Client wants secure login and fast data pipeline.")
    assert "functional" in result
    assert isinstance(result["functional"], list)
