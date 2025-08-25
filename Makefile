SHELL:=/bin/bash

SOFT:=ocs-pkgpush
PKG:=ocs-webutils
VERSION:=$(shell grep '^__version__ = ' $(SOFT) | cut -f 2 -d '"')
PATCH:=$(shell grep '^PKG_VERSION=' make-package-debian | cut -f 2 -d '=')


.PHONY: all help man pkg version pages clean check-depends check-metadata list
.ONESHELL:

all: man pkg

clean:
	@rm -rf public $(SOFT).1.gz $(SOFT).html pod2htmd.tmp

%.1.gz: %.pod Makefile
	@pod2man $< | gzip > $@

%.html: %.pod Makefile podstyle.css
	@pod2html --css podstyle.css --index --header $< > $@

man: $(SOFT).1.gz $(SOFT).html

pkg: $(SOFT) Makefile make-package-debian
	@./make-package-debian

pages: pkg $(SOFT).html Makefile
	@mkdir -p public/download
	@cp -p *.html       public/
	@cp -p podstyle.css public/
	@cp -p LICENSE.md  public/
	@echo -n "$(VERSION)-$(PATCH)" > public/version.txt
	@cp -p --no-clobber $(PKG)_*_all.deb  public/download/
	@(cd public; ln -sf $(SOFT).html index.html)
	@cd public/download
	@echo '<html><body><h1>OCS WebUtils Debian Package (Latest version: $(VERSION)-$(PATCH))</h1><ul>' > index.html
	@(while read file; do printf '<li><a href="%s">%s</a> (%s)</li>\n' $$file $$file $$(stat -c %y $$file | cut -f 1 -d ' '); done < <(ls -1t *.deb) >> index.html)
	@echo '</ul></body></html>' >> index.html

help:
	@echo "Possibles targets:"
	@echo " * all           : make manual"
	@echo " * pkg           : build Debian package"
	@echo " * pages         : build pages for GitLab-CI"
	@echo " * clean         : clean build files"
