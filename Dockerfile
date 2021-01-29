FROM node:6-slim

MAINTAINER Roman Krivetsky <r.krivetsky@gmail.com>

ARG VERSION=3.2.2

LABEL version=$VERSION

RUN npm install --global gitbook-cli &&\
	npm install gitbook-plugin-back-to-top-button &&\
	npm install gitbook-plugin-chapter-fold &&\
	npm install gitbook-plugin-code &&\
	npm install gitbook-plugin-splitter &&\
	npm install gitbook-plugin-search-pro &&\
	npm install gitbook-plugin-insert-logo &&\
	npm install gitbook-plugin-custom-favicon &&\
	npm install gitbook-plugin-pageview-count &&\
	npm install gitbook-plugin-tbfed-pagefooter &&\
	npm install gitbook-plugin-popup &&\
	npm install gitbook-plugin-sharing-plus &&\
	gitbook fetch ${VERSION} &&\
	npm cache clear &&\
	rm -rf /tmp/*

WORKDIR /srv/gitbook

VOLUME /srv/gitbook /srv/html

EXPOSE 4000 35729

CMD /usr/local/bin/gitbook serve
