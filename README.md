# Dora Web Upgrader

**Dora Web Upgrader is a [Rails] [engine] that facilitates upgrading a
[dora]-powered Rails application via webhooks.**

[dora], short for *Do*cker container for *Ra*ils applications, is my
collection of utilities that I use to containerize my Rails applications.

I use web hooks to trigger upgrades from within the container whenever I push
code to the main branch. When this engine receives a `POST` request, it will
execute dora's `upgrade-app.sh` script if the request contains a pre-configured
secret value. It sends an e-mail notification when the request has been received,
and another one when the upgrade process has finished.

If the `POST` request does not contain the correct secret, a notification
e-mail is also send, but no further action is triggered.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dora_web_upgrader', '~> 1.0'
```

And then execute:

```bash
bundle
```

Mount the engine onto your Rails application:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount DoraWebUpgrader::Engine, at: '/dora_web_upgrader'
  # ...
end
```

Generate an initializer:

```ruby
bin/rails generate dora_web_upgrader:install
```

And customize the resulting `config/initializers/dora_web_upgrader.rb`.

To avoid committing the Webhook secret in plain text to source control, the
default secret is read from the environment variable `$DORA_WEB_UPGRADER_SECRET`.
Of course you may also choose another means to store and retrieve the secret,
but make sure not to accidentally publish it.

## Usage

To make use of the engine, you must configure a Webhook in your Git repository
host (e.g., [GitHub] or [Gitea]) to issue a `POST` request to
`https://my_app.example.com/dora_web_upgrader/upgrade` with JSON data containing
the secret from the initializer file.

(If you mounted the engine at a different path, replace `dora_web_upgrader` in
the URL with that path.)

If everything is configured correctly, the upgrade process will start and finish
automagically. You should receive two e-mails. If you don't, double-check that
your mail server allows sending from and to the configured e-mail addresses.

## Development

To run tests, install [Docker] and [Docker Compose]. Clone DoraWebUpgrader and
[dora] into the same parent directory. Start up the container(s), execute `bash`
in the Rails container and run the tests like so:

```bash
$ cd dora_web_upgrader/
$ docker compose -f ../dora/docker-compose.yml --env-file .env up -d
Creating network "dora_default" with the default driver
Creating dora_selenium_1 ... done
Creating dora_db_1       ... done
Creating dora_redis_1    ... done
Creating dora_mailhog_1  ... done
Creating dora_rails_1    ... done
Creating dora_adminer_1  ... done
$ docker-compose -f ../dora/docker-compose.yml exec rails bash
[dora_web_upgrader development]root@459cb7dc2277:/home/dora/rails$ bin/rails test
Run options: --seed 41689

# Running:

......

Finished in 0.180743s, 33.1962 runs/s, 94.0560 assertions/s.
6 runs, 17 assertions, 0 failures, 0 errors, 0 skips
```

Note that with recent versions of docker compose, the `.env` file is no longer
read from the current working directory, but from the directory where the
`docker-compose.yml` file resides. Therefore, you must add the `--env-file`
option.

(There are several containers included in the `docker-compose.yml` file that
are not needed to test DoraWebUpgrader, but are part of [dora].)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

[docker]: https://docs.docker.com/engine/install/ubuntu/
[docker compose]: https://docs.docker.com/compose/install/
[dora]: https://github.com/bovender/dora
[engine]: https://guides.rubyonrails.org/engines.html
[gitea]: https://gitea.io
[github]: https://github.com
[Rails]: https://rubyonrails.org
