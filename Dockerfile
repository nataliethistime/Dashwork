FROM ruby:2.7.0
MAINTAINER Nathan McCallum <hello@nathan-mccallum.com>

#
# Update bundler
#
RUN gem install bundler --version 2.1.4

#
# Install node
#
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm install yarn --global

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock .ruby-version ./
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install
