FROM java:8-jre
LABEL maintainer="Joscha Feth <joscha@feth.com>"

ENV SAUCE_VERSION 4.4.12

WORKDIR /usr/local/sauce-connect

RUN apt-get update -qqy \
 && apt-get install -qqy \
      wget \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://saucelabs.com/downloads/sc-$SAUCE_VERSION-linux.tar.gz -O - | tar -xz

WORKDIR /usr/local/sauce-connect/sc-$SAUCE_VERSION-linux

ENV PATH /usr/local/sauce-connect/sc-$SAUCE_VERSION-linux/bin:$PATH

ENTRYPOINT ["sc"]

EXPOSE 4445
EXPOSE 8032

CMD ["--version"]
