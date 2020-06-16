default: all

gohugo:
	@hugo new site marklapointe

all: clean build publish

clean:
	@rm -rf MarkLaPointe.zip

build:
	@sh -c 'cd marklapointe && hugo -D'
	@sh -c 'cd resume && zip ../MarkLaPointe.zip *.docx *.pdf'
	@cp -R marklapointe/public/* config/www/
	@docker build . -t repository.cloudbsd.cat/general/mark_lapointe_com:latest

publish:
	@docker push repository.cloudbsd.cat/general/mark_lapointe_com:latest

fullcycle: all
	@git add . && git commit -m "Resume edit" && git push && ssh mlapointe@mark-lapointe.com 'cd /home/mlapointe/mark-lapointe.com && ./restart'