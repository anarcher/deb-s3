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
RUN git checkout 86e2415aed1e03f29846b7135f00f6340f05247a && bundle install

ENTRYPOINT ["/deb/deb-s3/bin/deb-s3"]
CMD ["help"]
