default:
	./build-news.sh > www/news.html
	cp gopher/news.md gemini/

deploy:
	chmod -R a+r gopher www gemini
	scp -r gopher/* deneb.im:/var/gopher
	scp -r www/* deneb.im:/var/www/htdocs/deneb.im/
	scp -r gemini/* deneb.im:/var/gemini/

.phony: deploy
