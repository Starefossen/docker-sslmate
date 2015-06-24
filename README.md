
## Usage

# Docker SSLMate

Docker image for running [SSLMate's](https://sslmate.com) command line utility.

## Supported tags and respective `Dockerfile` links

* [`latest`, `1.3.0` (Dockerfile)](https://github.com/Starefossen/docker-sslmate/blob/master/Dockerfile)

## What is SSLMate

`sslmate` is the command line client for [SSLMate](https://sslmate.com), a
service for purchasing and managing SSL certificates. SSLMate provides
easy-to-use tools for buying, renewing, and revoking certificates, for
monitoring the expiration date of your certificates, and for synchronizing your
certificates between your servers.

## How to use this image

This image makes it easy to used the sslmate client by mounting a volume where you want your certificates to go and run the sslmate command like this:

```
$ docker run --rm -v "$(pwd)/certs:/etc/sslmate" starefossen/sslmate sslmate ..
```

## License

This Docker image is licensed under the [MIT License](https://github.com/Starefossen/docker-sslmate/blob/master/LICENSE).

Software contained in this image is licensed under the following:

* SSLMate Client: [MIT License](https://github.com/SSLMate/sslmate/blob/master/COPYING)

## Supported Docker versions

This image is officially supported on Docker version 1.7.0.

Support for older versions (down to 1.0) is provided on a best-effort basis.

## User Feedback

### Documentation

* [SSLMate's help documentation](https://sslmate.com/help)

### Issues

If you have any problems with or questions about this image, please contact us
through a [GitHub issue](https://github.com/Starefossen/docker-sslmate/issues).

### Contributing

You are invited to contribute new features, fixes, or updates, large or small;
we are always thrilled to receive pull requests, and do our best to process them
as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub
issue](https://github.com/Starefossen/docker-sslmate/issues), especially
for more ambitious contributions. This gives other contributors a chance to
point you in the right direction, give you feedback on your design, and help
you find out if someone else is working on the same thing.
