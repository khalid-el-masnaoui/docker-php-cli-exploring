# Php-cli container custom image

## _Custom php-cli image with dependencies and extensions_

Exploring docker by creating custom php-cli image including many extensions and their dependencies.


## Extensions (All their dependencies are installed)

This php-cli image includes all the following extensions (installed and enabled).

| Extension | README |
| ------ | ------ |
| **Redis** | [Github Repository](https://github.com/redis/redis){:target="_blank"} |
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

In addition of the above extension , this php-cli image includes _**Composer**_ and _**PhpUnit**_ as well, installed globally.

## Docker
By default, the Docker will expose ports 8080/tcp for the php local server, so change this within the
Dockerfile if necessary. When ready, simply use the Dockerfile to
build the image.

```sh
cd docker-php-cli-exploring
#image build
docker build . -t cs-php-cli -f Dockerfile
```

This will create the custom php-cli image and pull-in/install the necessary dependencies and extensions.

Once done, run the Docker image and map the port to whatever you wish on
your host. In this example, we simply map port 8080 of the host to
port 8080 of the Docker (or whatever port was exposed in the Dockerfile):

```sh
#running the container container
docker run -itd  --rm -p 8080:8080 --name php-cli --mount type=bind,source=./src/,destination=/dockerBuild/ cs-php-cli
```

Verify the deployment by navigating to your server address in
your preferred browser.

```sh
127.0.0.1:8080
```

The above url will open a page displaying all PHP information. check all extensions are enabled such as opcache , apcu , jit ...