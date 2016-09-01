FROM ruby:2.3.1
RUN mkdir /workshop
WORKDIR /workshop
ADD Gemfile /workshop/Gemfile
ADD Gemfile.lock /workshop/Gemfile.lock
RUN apt-get update && apt-get install netcat nodejs -y
RUN bundle install
ADD . /workshop
ENTRYPOINT ["/workshop/bin/rails", "server", "-b", "0.0.0.0"]
