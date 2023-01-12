.DEFAULT_GOAL := help

.PHONY: help
help:
	@ echo "List of make commands and their description :"
	@ grep -E '^\.PHONY: [a-zA-Z0-9_-]+ .*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = "(: |##)"}; {printf "\033[36m%-30s\033[0m %s\n", $$2, $$3}'

.PHONY: upgrade-pip  ## ⏬  Upgrade pip
upgrade-pip:
	pip install --upgrade pip

.PHONY: dependencies  ## ⏬  Install production dependencies
dependencies: upgrade-pip
	pip install -r requirements/prod

.PHONY: test-dependencies  ## ⏬  Install test dependencies
test-dependencies: upgrade-pip
	pip install -r requirements/test

.PHONY: doc-dependencies ## ⏬  Install doc dependencies
doc-dependencies: upgrade-pip
	pip install -r requirements/doc

.PHONY: lint-dependencies ## ⏬  Install doc dependencies
lint-dependencies: upgrade-pip
	pip install -r requirements/lint

.PHONY: dev-dependencies  ## ⏬  Install dev dependencies
dev-dependencies: upgrade-pip
	pip install -r requirements/dev

.PHONY: dev-environment  ## 👷 Install package in dev mode and all dependencies
dev-environment: upgrade-pip
	pip install -e '.[dev]'

.PHONY: unit-tests  ## ✅  Run unit tests
unit-tests:
	python -m pytest --cov=my_package/ . -vv -p no:warnings

.PHONY: dist  ## 📦 Build source and wheel package
dist: clean
	python setup.py sdist
	python setup.py bdist_wheel
	ls -l dist

.PHONY: push ## 🏹 Add and commit with message 'update' then pushes to remote
push:
	git add .
	git commit -m'update'
	git push

.PHONY: clean  ## ✨  Remove all build, test, coverage and Python artifacts
clean: clean-build clean-pyc clean-test

.PHONY: clean-build  ## 🧹 Remove build artifacts
clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

.PHONY: clean-pyc  ## 🧹 Remove Python file artifacts
clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

.PHONY: clean-test  ## 🧹 Remove test and coverage artifacts
clean-test:
	rm -fr .tox/
	rm -f .coverage
	rm -fr htmlcov/
	rm -fr .pytest_cache

.PHONY: clean-reference-doc  ## 🧹 Remove reference documentation
clean-reference-doc:
	@ if [ -d docs/docs/reference ]; then rm -Rf docs/docs/reference; fi

.PHONY: serve  ## serve mkdocs
serve: clean-reference-doc
	@ cd docs && mkdocs serve