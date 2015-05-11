FROM debian:wheezy
MAINTAINER anarcher, anarcher@gmail.com
ENV HOME /root

RUN apt-get update && apt-get install -y \
  ruby1.9.3 \
  rubygems \
  gnupg \
  gnupg-agent \
  dpkg-sig \
  git \
  libxml2 \
  libxml2-dev \
  libxslt-dev

RUN gem install bundler

WORKDIR /deb
RUN git clone https://github.com/anarcher/deb-s3.git

WORKDIR /deb/deb-s3
RUN git checkout 0a0fafb44d032baf1ee3f3b2f9dd0af7820171de && bundle install

ENTRYPOINT ["/deb/deb-s3/bin/deb-s3"]
CMD ["help"]
