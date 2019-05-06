FROM ruby:2.5.3-alpine3.8

RUN apk add --no-cache --update build-base
RUN apk add --no-cache --update linux-headers
RUN apk add --no-cache --update postgresql-dev
RUN apk add --no-cache --update nodejs
RUN apk add --no-cache --update sqlite-dev
RUN apk add --no-cache --update tzdata
RUN mkdir -p /shreddit

WORKDIR /blog

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v 2.0.1
RUN bundle install

COPY . .

RUN rails db:migrate
RUN rails db:seed

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
