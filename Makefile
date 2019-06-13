CONTENT_DIR := content
SITE_DIR := _site
PUBLISH := cp
DOMAIN := byronjsmith.com

help:
	@echo 'Run `make upload` to build the site and push to github.'

publish: ${CONTENT_DIR}
	-rm -r ${SITE_DIR}
	@mkdir -p ${SITE_DIR}
	echo ${DOMAIN} > ${SITE_DIR}/CNAME
	${PUBLISH} ${CONTENT_DIR}/* ${SITE_DIR}

upload: publish
	ghp-import -b master -m "`date`" -p ${SITE_DIR}

preview: publish
	open _site/index.html
