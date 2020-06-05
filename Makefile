default: all


all: build publish

build:
	@docker build . -t repository.cloudbsd.cat/general/mark_lapointe_com:latest

publish:
	@docker push repository.cloudbsd.cat/general/mark_lapointe_com:latest