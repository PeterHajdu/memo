default:
	./build-gopher.sh
	./build-html.sh
	./build-gemini.sh

deploy:
	chmod -R a+Xr public_gopher
	openrsync --rsync-path=openrsync -r --del ./public_gopher/ deneb.im:public_gopher
	chmod -R a+Xr public_html
	openrsync --rsync-path=openrsync -r --del ./public_html/ deneb.im:public_html
	chmod -R a+Xr gemini
	openrsync --rsync-path=openrsync -r --del ./gemini/ deneb.im:/var/gemini/users/hptr

.phony: posts deploy
