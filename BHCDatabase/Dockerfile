FROM ruby:2.3.3-onbuild

RUN apt-get update -qq && apt-get install -y build-essential

RUN apt-get install -y nodejs

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]