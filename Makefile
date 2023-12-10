all: install_dev install test lint format

install_dev: clean
	python -m pip install ".[dev]"

install: clean
	python -m pip install .

clean:
	rm -f .coverage
	rm -f coverage.xml
	rm -Rf .eggs
	rm -Rf .pytest_cache
	rm -Rf .ruff_cache
	rm -Rf __pycache__
	rm -Rf **/__pycache__/*
	rm -Rf **/*.c
	rm -Rf **/*.so
	rm -Rf **/*.pyc
	rm -Rf dist/
	rm -Rf build/
	rm -Rf docs/build
	rm -Rf faculty.egg-info
	pip uninstall -y facultyai

test:
	coverage run --source= -m pytest -vvv tests/
	coverage report -m
	coverage xml

lint:
	ruff check --fix .

format:
	ruff format .
