ASSETS = ./images/php/pkg/

build:
	docker build -t dobe_ssdb ./images/ssdb
run:
	docker run -i -p 16379:16379 -v ./volumes/data/ssdb:/var/lib/ssdb -t dobe_ssdb /bin/bash
install:
	docker-compose build
up:
	docker-compose up -d
restart:
	docker-machine restart default && eval "$(docker-machine env default)"
rmi:
	docker rmi -f $(docker images -a | grep "<none>" | awk "{print \$3}")
php:
	bash -c "clear && DOCKER_HOST=tcp://192.168.99.100:2376 DOCKER_CERT_PATH=/Users/in10/.docker/machine/machines/default DOCKER_TLS_VERIFY=1 docker exec -it dobe_php_1 bash"
dl:
	wget https://pecl.php.net/get/memcached-2.1.0.tgz -O $(ASSETS)memcached.tgz
	wget https://pecl.php.net/get/memcache-3.0.8.tgz -O $(ASSETS)memcache.tgz
	wget https://pecl.php.net/get/apcu-4.0.10.tgz -O $(ASSETS)apcu.tgz
	wget https://pecl.php.net/get/msgpack-0.5.6.tgz -O $(ASSETS)msgpack.tgz
	wget https://pecl.php.net/get/xdebug-2.3.3.tgz -O $(ASSETS)xdebug.tgz
	wget https://pecl.php.net/get/xhprof-0.9.4.tgz -O $(ASSETS)xhprof.tgz
	wget https://pecl.php.net/get/mongo-1.6.0.tgz -O $(ASSETS)mongo.tgz
	wget https://pecl.php.net/get/redis-2.2.7.tgz -O $(ASSETS)redis.tgz
	wget https://pecl.php.net/get/gearman-1.1.2.tgz -O $(ASSETS)gearman.tgz
	wget https://getcomposer.org/composer.phar -O $(ASSETS)composer.phar
	wget https://github.com/phalcon/cphalcon/archive/phalcon-v2.0.9.tar.gz -O $(ASSETS)cphalcon.tgz
	wget http://pecl.php.net/get/swoole-1.8.1.tgz -O $(ASSETS)swoole.tgz
	wget http://nodejs.org/dist/v5.9.1/node-v5.9.1-linux-x64.tar.gz -O $(ASSETS)node.tgz
