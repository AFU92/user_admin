# USER ADMIN

This application covers the CRUD operation for User module and the preferences associated. All the EndPoints are following Restful API standard:
You can find insomnia folder with all the request examples in `./documentation/Insomnia_UserAdmin.json`

This app has a test coverage of `99.37%`

## How To Run

### Docker ready to run

In order to run this application you must have installed [Docker](https://www.docker.com/products/docker-desktop) and [Docker-compose](https://docs.docker.com/compose/install/)
Then you must run the following commands:

```shell
docker-compose up
docker-compose run web rake db:create
docker-compose run web rake db:migrate
```

### Run in development environment

In order to run this app in development environment you must install:
* [Ruby](https://www.ruby-lang.org/en/downloads/)
* [Rails](https://guides.rubyonrails.org/v5.0/getting_started.html#installing-rails)
* [PostgreSQL](https://www.postgresql.org/download/)

An then, you must configure the file `./config/database.yml` with the postgresql user and run the following commands:

```shell
bundle install
rake db:create
rake db:migrate
rails server
```

## Author
Andrea Fuentes