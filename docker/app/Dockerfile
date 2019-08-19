FROM ruby:2.5-alpine

RUN apk update && apk add less build-base tzdata nodejs postgresql-dev imagemagick bash

RUN mkdir /myapp
WORKDIR /myapp


COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

ENV BUNDLER_VERSION 2.0.2
RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY /entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Start the main process.
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
