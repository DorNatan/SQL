import glob
import pytest

@pytest.mark.parametrize("sql_file", glob.glob("*.sql"))
def test_contains_select(sql_file):
    with open(sql_file, 'r', encoding='utf-8', errors='ignore') as f:
        contents = f.read().lower()
    assert "select" in contents, f"{sql_file} does not contain a SELECT statement"
