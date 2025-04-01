import pytest
from hello import hello_world

def test_hello_world():
    """Test that hello_world function returns the expected greeting."""
    assert hello_world() == "Hello, World!"

if __name__ == "__main__":
    try:
        test_hello_world()
        print("Tests passed, fam!")
    except AssertionError as e:
        print(f"Test flopped: {e}")
        exit(1)

