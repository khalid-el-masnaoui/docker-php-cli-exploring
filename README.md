# PHP-CLI container custom image

## _Custom php-cli image with dependencies and extensions_

Exploring docker by creating custom php-cli image including many extensions and their required dependencies, and mapping the container user UID with the host UID to make shared files (via volumes) accessibles.


## Extensions :sparkles:

This php-cli image includes all the following extensions (installed and enabled).

| Extension | README |
| ------ | ------ |
| **Redis** | [Github Repository](https://github.com/redis/redis) |
| **Memcached** | [Github Repository](https://github.com/memcached/memcached) |
| **Apcu** | [PHP Manual](https://www.php.net/manual/en/book.apcu.php) |
| **Mcrypt** | [PHP Manual](https://www.php.net/manual/en/book.mcrypt.php) |
| **Iconv** | [PHP Manual](https://www.php.net/manual/en/function.iconv.php) |
| **Mbstring** | [PHP Manual](https://www.php.net/manual/en/book.mbstring.php) |
| **Mysqli** | [PHP Manual](https://www.php.net/manual/en/book.mysqli.php) |
| **Pdo_mysql** | [PHP Manual](https://www.php.net/manual/en/ref.pdo-mysql.php) |
| **Sockets** | [PHP Manual](https://www.php.net/manual/en/book.sockets.php) |
| **Zip** | [PHP Manual](https://www.php.net/manual/en/book.zip.php) |
| **Pcntl** | [PHP Manual](https://www.php.net/manual/en/book.pcntl.php) |
| **Ftp** | [PHP Manual](https://www.php.net/manual/en/book.ftp.php) |
| **Bcmath** | [PHP Manual](https://www.php.net/manual/en/book.bc.php) |
| **Intl** | [PHP Manual](https://www.php.net/manual/en/book.intl.php) |
And many others, you can discover them by yourself :eyes:

In addition of the above extension , this php-cli image includes _**Composer**_ and _**PhpUnit**_ as well, installed globally, and such as _wget_, _vim_, _git_, _unzip_ ...


## PHP Configurations :gear:

This php-cli is not using the custom php configs, instead it is relaying on some custom configurations found inside the folder _**/usr/local/etc/php/**_, specifcally _php.ini_ file and the enabled modules inside the folder _conf.d_, in which only opache module (_opache.ini_) has custom configurations.
feel free to update those configs as per your need.
the container is running under www-data user with UID mapped to the host local user's UID


## Docker :hammer_and_wrench:
By default, the Docker will expose ports 8080/tcp for the php local server, so change this within the
Dockerfile if necessary. When ready, simply use the Dockerfile to
build the image.

```sh
cd docker-php-cli-exploring
#create logs directory since it is mounted to the container (or you can use --volume instead of --mount option and the logs folder will be created automatically on the local host)
mkdir logs

#image build
docker build . -t cs-php-cli -f Dockerfile -build-arg="UID=$(id -u)" --build-arg="GID=$(id -g)"
```

This will create the custom php-cli image and pull-in/install the necessary dependencies and extensions.

Once done, run the Docker image and map the port to whatever you wish on
your host. In this example, we simply map port 8080 of the host to
port 8080 of the Docker (or whatever port was exposed in the Dockerfile):

```sh
#running the container container
docker run -itd  --rm -p 8080:8080 --name php-cli --mount type=bind,source=./src/,destination=/dockerBuild/  --mount type=bind,source=./logs/,destination=/var/log/php/ cs-php-cli
```

Verify the deployment by navigating to your server address in
your preferred browser.

```sh
127.0.0.1:8080
```

The above url will open a page displaying all PHP information. check all extensions are enabled such as opcache , apcu , jit ...

