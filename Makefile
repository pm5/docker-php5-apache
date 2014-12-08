PWD=`pwd`

.PHONY: build test run start stop clean

build:
	docker build --rm=true -t pomin5/php5-apache .

test:
	docker run -it --rm=true -p 8080:80 --name php5-apache -v $(PWD):/app pomin5/php5-apache /bin/bash

run:
	docker run -d -p 8080:80 --name=php5-apache -v $(PWD):/app pomin5/php5-apache

start:
	docker start php5-apache

stop:
	docker stop php5-apache

clean:
	docker rm -f php5-apache || true
