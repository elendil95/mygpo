all: help

help:
	@echo 'make test            run tests and show coverage report'
	@echo 'make clean           clean up files'

dev-config:
	mkdir -p envs/dev
	echo django.core.mail.backends.console.EmailBackend > envs/dev/EMAIL_BACKEND
	echo secret > envs/dev/SECRET_KEY
	echo postgres://mygpo:mygpo@localhost/mygpo > envs/dev/DATABASE_URL
	echo True > envs/dev/DEBUG

test: envs/dev/MEDIA_ROOT
	# assume defined media root directory, empty before running tests
	rm -rf $(shell cat envs/dev/MEDIA_ROOT)
	mkdir -p $(shell cat envs/dev/MEDIA_ROOT)
	envdir envs/dev/ python -Wd -m pytest --cov=mygpo/ --cov-branch
	coverage report --show-missing

update-po:
	envdir envs/dev python manage.py makemessages \
		--ignore=doc/* --ignore=envs/* --ignore=media/* --ignore=venv/* \
		--ignore=res/* --ignore=tools/* --ignore=mygpo/*/migrations/* \
		--ignore=static/* --all

compilemessages:
	envdir envs/dev/ python manage.py compilemessages

notebook:
	envdir envs/dev/ python manage.py shell_plus --notebook

clean:
	git clean -fX

install-deps:
	sudo yum module install postgresql:15/server
	sudo dnf install libpq-devel libjpeg-devel zlib-devel libwebp-devel \
		make automake autoconf gcc gcc-c++ python36 python3-virtualenv python36-devel libffi-devel \
		gettext redis

format-code:
	black --target-version py38 --skip-string-normalization mygpo/

check-code-format:
	black --check --target-version py38 --skip-string-normalization mygpo/


.PHONY: all help test clean unittest coverage install-deps format-code

