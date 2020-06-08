default: all

gohugo:
	@hugo new site marklapointe

all: build publish

build:
	@sh -c 'cd marklapointe && hugo -D'
	@cp -R marklapointe/public/* config/www/
	@docker build . -t repository.cloudbsd.cat/general/mark_lapointe_com:latest

publish:
	@docker push repository.cloudbsd.cat/general/mark_lapointe_com:latest

fullcycle: all
	@git add . && git commit -m "Resume edit" && git push && ssh mlapointe@mark-lapointe.com 'cd /home/mlapointe/mark-lapointe.com && ./restart'