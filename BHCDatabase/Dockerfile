FROM ruby:2.3.3-slim

MAINTAINER David Brown <david_a_brown@mac.com>

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev

ENV INSTALL_PATH /bhc

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./

RUN bundle install --binstubs
# We want binstubs to be available so we can directly call sidekiq and
# potentially other binaries as command overrides without depending on
# bundle exec.
# This is mainly due for production compatibility assurance.

COPY . .
# This might look a bit alien but it's copying in everything from
# the current directory relative to the Dockerfile, over to the
# /my_dockerized_app folder inside of the Docker image.
#
# We can get away with using the . for the second argument because
# this is how the unix command cp (copy) works. It stands for the
# current directory.

RUN bundle exec rake RAILS_ENV=production DATABASE_URL=postgresql://user:pass@127.0.0.1/dbname ACTION_CABLE_ALLOWED_REQUEST_ORIGINS=foo,bar SECRET_TOKEN=dummytoken assets:precompile
# Provide a dummy DATABASE_URL and more to Rails so it can pre-compile
# assets. The values do not need to be real, just valid syntax.
#
# If you're saving your assets to a CDN and are working with multiple
# app instances, you may want to remove this step and deal with asset
# compilation at a different stage of your deployment.

VOLUME ["$INSTALL_PATH/public"]
# In production you will very likely reverse proxy Rails with nginx.
# This sets up a volume so that nginx can read in the assets from
# the Rails Docker image without having to copy them to the Docker host.

CMD puma -C config/puma.rb
# This is the command that's going to be ran by default if you run the
# Docker image without any arguments.
#
# In our case, it will start the Puma app server while passing in
# its config file.