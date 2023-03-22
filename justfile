default:
    @just --list

build:
    @poetry build
    @echo "Built lib"
    @poetry install
    @echo "Installed new lib"

format:
    @poetry run black .

test: build
    @poetry run black --check .
    @poetry run pytest -rFE

get_payload: build
    @poetry run python scripts/get_payload.py

test_live: build
    @poetry run python scripts/test_wrap.py
