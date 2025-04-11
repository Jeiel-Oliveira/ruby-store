FROM ruby:3.4.1 AS store-development

ENV APP=/opt/app
RUN mkdir -p $APP

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends \ 
  nodejs \
  yarn \
  build-essential \
  sudo

RUN adduser store_user
RUN adduser store_user sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER store_user
WORKDIR $APP

COPY . .

RUN sudo chown -R store_user:store_user $APP
RUN sudo chown -R store_user:store_user /usr/local/bundle

RUN rm -rf node_modules vendor
RUN gem install rails bundler

RUN bundle install
RUN yarn install

EXPOSE 8010
# Start server
CMD ["./bin/thrust", "./bin/rails", "server", "-b", "0.0.0.0", "-p", "8010"]