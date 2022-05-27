STAGING_URL=https://epistolae2.stage.ccnmtl.columbia.edu/
PROD_URL=https://epistolae.ctl.columbia.edu/
STAGING_BUCKET=epistolae2.stage.ccnmtl.columbia.edu
PROD_BUCKET=epistolae.ctl.columbia.edu
INTERMEDIATE_STEPS ?= echo nothing

JS_FILES=themes/ctl-epistolae/static/js/src

all: eslint

include *.mk

clean:
	rm -rf $(PUBLIC)/*
	rm -rf node_modules/*

clean-content:
	rm -rf content/people/*.html.md
	rm -rf content/woman/*.html.md
	rm -rf content/letter/*.html.md

$(PUBLIC)/js/all.json: $(PUBLIC)/json/all/index.html
	mkdir $(PUBLIC)/js/ || true
	mv $< $@ && ./checkjson.py

.PHONY: clean
