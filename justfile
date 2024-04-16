set shell := ["zsh", "-cu"]

default:
  just --list

docs-serve:
  mkdocs serve

docs-build:
  mkdocs build

venv: 
  python -m venv .venv
  # Use uv package to pip install.
  # Ref: https://github.com/astral-sh/uv?tab=readme-ov-file#highlights
  source .venv/bin/activate \
    && pip install uv \
    && uv pip install -r requirements.txt \
    && uv pip install -r requirements-dev.txt

test:
  python -m pytest --doctest-modules ./tests
