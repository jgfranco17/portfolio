PROJECT_NAME := "aeternum"

# Default command
_default:
    @just --list --unsorted

# Set up dependencies
install:
    @poetry install
    @echo "Installed Poetry dependencies!"

# Run mkdocs bin
mkdocs *ARGS:
    @poetry run mkdocs {{ ARGS }}

# Run the development server
up:
    @poetry run mkdocs build --clean --strict
    @poetry run mkdocs serve --open
