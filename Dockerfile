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

WORKDIR /
RUN git clone https://github.com/anarcher/deb-s3.git

WORKDIR /deb-s3/
RUN git checkout 1be201cd8eff052375fa83db6be8e1510e4e8345 && bundle install

ENTRYPOINT ["/deb-s3/bin/deb-s3"]
CMD ["help"]
