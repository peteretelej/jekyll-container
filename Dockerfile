FROM ruby:latest
MAINTAINER Peter Etelej <peter@etelej.com>

RUN apt-get -qq update && \
	apt-get -qq install nodejs -y && \
	gem install -q bundler

RUN mkdir -p /etc/jekyll && \
	printf 'source "https://rubygems.org"\ngem "github-pages"\ngem "execjs"\ngem "rouge"' > /etc/jekyll/Gemfile && \
	printf "\nBuilding required Ruby gems. Please wait..." && \
	bundle install --gemfile /etc/jekyll/Gemfile --clean --quiet 

RUN apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV BUNDLE_GEMFILE /etc/jekyll/Gemfile

EXPOSE 4000

ENTRYPOINT ["bundle", "exec"]

CMD ["jekyll", "serve","--host=0.0.0.0"]

