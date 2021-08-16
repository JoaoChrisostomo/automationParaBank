FROM ruby:2.5-alpine

RUN echo "http://dl-4.alpinelinux.org/alpine/v3.9/main" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/v3.9/community" >> /etc/apk/repositories

RUN apk update && \
	  apk add build-base \
    libxml2-dev \
    libxslt-dev \
    curl unzip libexif udev chromium chromium-chromedriver wait4ports xvfb xorg-server dbus ttf-freefont mesa-dri-swrast \
    && rm -rf /var/cache/apk/*

RUN gem install nokogiri -v '1.11.1'

ADD Gemfile .

RUN bundle install --path=vendor/cache
