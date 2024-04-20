www/news.html:
	./build-news.sh > www/news.html

deploy:
	chmod -R a+r gopher www
	scp -r gopher/* deneb.im:/var/gopher
	scp -r www/* deneb.im:/var/www/htdocs/deneb.im/

all: www/news.html

.phony: all deploy
