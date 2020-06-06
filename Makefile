default: all

gohugo:
	@hugo new site marklapointe

all: build publish

build:
	@cp -R marklapointe/public/* config/www/
	@docker build . -t repository.cloudbsd.cat/general/mark_lapointe_com:latest

publish:
	@docker push repository.cloudbsd.cat/general/mark_lapointe_com:latest