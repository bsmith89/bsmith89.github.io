CONTENT_DIR := content
SITE_DIR := _site

help:
	@echo 'Run `make upload` to build the site and push to github.'

publish: ${SITE_FILES}
	rm -r ${SITE_DIR}
	@mkdir -p ${SITE_DIR}
	cp ${CONTENT_DIR}/* ${SITE_DIR}

upload: publish
	ghp-import -b master -m "`date`" -p ${SITE_DIR}

serve: publish
	cd ${SITE_DIR}; python3 -m http.server
