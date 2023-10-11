# # Makefile
#
# Frederico Sales
# <frederico@fredericosales.eng.brr>
# 2022
#


#
## settings
#
.PHONY: all \
		help \
		run \
		clean \
		clear \
		install \
		update \
		db


#
## PATH's
#
ARG          := $1
PORT         := 5432
DB_USER      := 'frederico'
DATABASE     := 'crawler'
PROJECT      := 'spyder'
SRC          := src/
VENV_BIN_DIR := ~/.venvs/${PROJECT}/bin
ACTIVATE     := ${VENV_BIN_DIR}/activate
PYTHON_BIN   := ${VENV_BIN_DIR}/python
PIP_BIN      := ${VENV_BIN_DIR}/pip
REQUIREMENTS := requirements/requirements.txt
DUMP         := scripts/${PROJECT}-`date +"%Y-%m-%d_%H-%M-%S"`.json
DATE         := `date +"%Y-%m-%d_%H-%M-%S"`


#
## targets
#


#: Do nothing, make nothing.
all:
	@clear
	@echo ""
	@echo "This target do nothing."
	@echo "Try make help."
	@echo ""


#: Display help and targets.
help:
	@clear
	@echo "Display this help, and targets."
	@echo ""
	@echo "--------------------------------------------------"
	@grep -B1 -E "^[a-zA-Z0-9_-]+\:([^\=]|$$)" Makefile \
     | grep -v -- -- \
     | sed 'N;s/\n/###/' \
     | sed -n 's/^#: \(.*\)###\(.*\):.*/\2###\1/p' \
     | column -t  -s '###'
	 @echo "--------------------------------------------------"
	@echo ""


#: Run application.
run:
	@clear
	@scrapy runspider ${SRC}/crawler/./main.py


#: Light cleaning.
clean:
	@clear
	@find . -name "*.pyc" -exec rm -f {} +
	@find . -type d -name "__pycache__" -exec rm -rf {} +
	@find . -type f -name ".DS_Store" -exec rm -rf {} +


#: heavy cleaning.
clear:
	@clear
	@find . -name "*.pyc" -exec rm -f {} +
	@find . -type d -name "__pycache__" -exec rm -rf {} +
	@find . -type f -name ".DS_Store" -exec rm -rf {} +
	@find . -type d -name ".ipynb_checkpoints" -exec rm -rf {} +
	@find . -type d -name "dist" -exec rm -rf {} +


#: Duh self explanatory...
install:
	${PIP_BIN} install -U pip setuptools wheel
	${PIP_BIN} install -r ${REQUIREMENTS}


#: Update the project requirements.
update:
	${PIP_BIN} install -U pip setuptools wheel
	${PIP_BIN} install -U -r ${REQUIREMENTS}


#: Deploy the postgresql docker micro service
db:
	@clear
	@docker-compose -f /src/docker/docker-compose.yaml up -d 

