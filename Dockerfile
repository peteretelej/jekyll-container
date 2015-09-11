FROM ruby:2.2
MAINTAINER Peter Etelej <peter@etelej.com>

RUN gem install bundler

CMD ["/bin/bash"]

