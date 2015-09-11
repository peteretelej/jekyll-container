FROM ruby:2.2
MAINTAINER Peter Etelej <peter@etelej.com>

EXPOSE "4000:4000"
RUN apt-get update && \
	apt-get install nodejs && \
	gem install bundler && \ 
	mkdir -p /etc/jekyll && \
	printf 'source "https://rubygems.org"\ngem "github-pages"\ngem "execjs"' > /etc/jekyll/Gemfile
	bundle install --clean --gemfile /etc/jekyll/Gemfile

RUN apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

	
CMD ["/bin/bash"]

