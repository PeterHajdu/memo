default:
	./build-gopher.sh
	./build-html.sh

deploy:
	chmod -R a+Xr public_gopher
	scp -r public_gopher deneb.im:
	chmod -R a+Xr public_html
	scp -r public_html/* deneb.im:public_html/

.phony: posts deploy
