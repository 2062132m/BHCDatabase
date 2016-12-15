# Use the docker hub ruby image as a base.
# More on this image here: https://hub.docker.com/_/rails/
FROM ruby:2.2.3

MAINTAINER David Brown <david_a_brown@mac.com>


# Update and install stuff your app needs to run
RUN apt-get update -qq
RUN apt-get install -y build-essential curl git imagemagick libmagickwand-dev libcurl4-openssl-dev nodejs postgresql-client

# Installing your gems this way caches this step so you dont have to reintall your gems every time you rebuild your image.
# More info on this here: http://ilikestuffblog.com/2014/01/06/how-to-skip-bundle-install-when-deploying-a-rails-app-to-docker/
# Copy the Gemfile and Gemfile.lock into the image.
# Temporarily set the working directory to where they are.
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

# Install and configure nginx
RUN apt-get install -y nginx
RUN rm -rf /etc/nginx/sites-available/default
ADD container/nginx.conf /etc/nginx/nginx.conf

# Add our source files precompile assets
ENV APP_HOME /var/app/APPNAME
RUN mkdir -p $APP_HOME
ADD . $APP_HOME
WORKDIR $APP_HOME
RUN RAILS_ENV=production bundle exec rake assets:precompile --trace

# Start up foreman
CMD ["foreman", "start"]