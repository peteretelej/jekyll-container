FROM ruby:2.2
MAINTAINER Peter Etelej <peter@etelej.com>

COPY ./vol /vol

RUN gem install bundler && \ 
	bundle install --gemfile /vol/Gemfile

CMD ["/bin/bash"]

