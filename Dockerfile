FROM ruby:2.2
MAINTAINER Peter Etelej <peter@etelej.com>

VOLUME ["../etelej.github.io:/code","./jekyll-container/vol:/vol"]
WORKDIR /
RUN gem install bundler && \ 
	bundle install /vol

CMD ["/bin/bash"]

