
.PHONY: build test clean

build:
	docker build --rm -t pomin5/php5-apache .

test:
	docker run -it --rm -p 8080:80 --name php5-apache \
		-v $(PWD):/var/www \
		-v $(PWD)/.run/log:/var/log \
	 	pomin5/php5-apache /bin/bash

clean:
	docker rm -f php5-apache || true
