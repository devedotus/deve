# deve - Simple Wordpress Orchestration

A simple, secure and performant way of developing and self-hosting Wordpress.org sites.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

All you need to get started is `git`, `docker` and `docker-compose`. To check if you have both installed correctly just check the version in your preferred terminal.

```sh
$ git --version
git version 2.16.2
$ docker --version
Docker version 17.12.0-ce, build c97c6d6
$ docker-compose --version
docker-compose version 1.18.0, build 8dd22a9
```

If you don't want to set all of this up but you'd like to play around with this repository, check out play-with-docker.com!

### Installing

A step by step series of examples that tell you have to do to get a development environment running.

Clone, fork or download the Github repository.

```sh
$ git clone https://github.com/devedotus/deve
Cloning into 'deve'...
remote: Counting objects: 299, done.
remote: Compressing objects: 100% (190/190), done.
remote: Total 299 (delta 116), reused 272 (delta 92), pack-reused 0
Receiving objects: 100% (299/299), 56.62 KiB | 11.32 MiB/s, done.
Resolving deltas: 100% (116/116), done.
```

*Only if you want to have the edgy WP CLI with deve commands,* download the CLI repository.

```sh
$ git clone https://github.com/devedotus/cli
Cloning into 'cli'...
remote: Counting objects: 165, done.
remote: Compressing objects: 100% (111/111), done.
remote: Total 165 (delta 73), reused 140 (delta 48), pack-reused 0
Receiving objects: 100% (165/165), 215.35 KiB | 12.67 MiB/s, done.
Resolving deltas: 100% (73/73), done.
```

Move into the `deve` directory and setup your environmental variables.

```sh
$ cd deve && mv .env.sample .env
```

Edit `.env` to make it look similar to this.

```
MYSQL_ROOT_PASSWORD=eiXainah3waighai
DEVE_DOMAIN=local.deve.us
DEVE_USER=admin
DEVE_PASSWORD=example
DEVE_EMAIL=example@deve.us
DEVE_TITLE=Default Deve.us Install
DEVE_DATABASE=deve
DEVE_DATABASE_PASSWORD=mQXC2en5QnVkeCNQPd
```

Run `docker-compose` and get your services started.

```sh
$ docker-compose up -d
### A LOT OF OUTPUT IF IMAGES ARE BEING BUILT ###
Creating deve_web_1   ... done
Creating deve_mysql_1 ...
Creating deve_php_1   ... done
Creating deve_php_1   ...
Creating deve_wp_1    ... done
```

Now the default nginx should run on your port `80`. Next you want to setup deve.

```sh
$ docker-compose run --rm wp deve setup
Starting deve_web_1 ... done
Starting deve_php_1 ... done
Success: Generated 'wp-config.php' file.
Success: Database created.
Success: WordPress installed successfully.
Success: deve is set up on local.deve.us!
```

Now you can navigate to your deve instance and start playing around with it. 

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Docker Engine](https://docs.docker.com/engine/) - The Containers
* [Docker Hub](https://hub.docker.com/u/devedotus) - The Image Hub
* [Docker Compose](https://docs.docker.com/compose/) - The Orchestration
* [MariaDB](https://mariadb.org/) - The Database
* [Nginx](https://nginx.org/en/) - The Load Balancer
* [PHP-FPM](https://php-fpm.org/) - The FastCGI Process Manager
* [WP-CLI](https://wp-cli.org/) - The CLI for Wordpress & deve

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/devedotus/deve/tags).

## Authors

* **Thomas Stachl** - *Initial work* - [tstachl](https://github.com/tstachl)

See also the list of [contributors](https://github.com/devedotus/deve/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc
