FROM ruby:2.6.2
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler
RUN bundle config set --local disable_checksum_validation true
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

RUN mkdir -p tmp/sockets
RUN mkdir tmp/pids
CMD bundle exec puma
# Configure the main process to run when running the image
# CMD ["rails", "server", "-b", "0.0.0.0"]