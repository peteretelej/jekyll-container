FROM ruby:latest
MAINTAINER Peter Etelej <peter@etelej.com>

RUN apt-get -qq update && \
	apt-get -qq install nodejs -y && \
	gem install bundler

RUN mkdir -p /etc/jekyll && \
	printf 'source "https://rubygems.org"\ngem "github-pages"\ngem "execjs"' > /etc/jekyll/Gemfile && \
	bundle install --clean --gemfile /etc/jekyll/Gemfile

EXPOSE 4000

RUN apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


CMD ["/bin/bash"]

