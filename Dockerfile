FROM ruby:3.4.1 AS store-development

ENV INSTALL_PATH=/opt/app
RUN mkdir -p $INSTALL_PATH

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn build-essential

WORKDIR $INSTALL_PATH
COPY . .

RUN rm -rf node_modules vendor
RUN gem install rails bundler

RUN bundle install
RUN yarn install

EXPOSE 8010
# Start server
CMD ["./bin/thrust", "./bin/rails", "server", "-b", "0.0.0.0", "-p", "8010"]