# Php-cli container custom images

## _Custom php-cli images with dependencies and extensions_

Exploring docker by creating custom php-cli images with dependencies and extensions

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
