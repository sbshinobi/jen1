import pytest
from hello import hello_world

def test_hello_world():
    """Test that hello_world function returns the expected greeting."""
    assert hello_world() == "1234","values didn't match"

if __name__ == "__main__":
    pytest.main()

