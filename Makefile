SITE_FILES := $(wildcard *.html)
SITE_DIR := site/

help:
	@echo 'Run `make upload` to build the site and push to github.'

upload: ${SITE_FILES}
	@mkdir -p ${SITE_DIR}
	cp $^ ${SITE_DIR}
	ghp-import -b master -m "`date`" -p ${SITE_DIR}
