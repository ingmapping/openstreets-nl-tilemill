FROM ubuntu:14.04
MAINTAINER ingmapping "contact@ingmapping.com"

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get -y install python-software-properties software-properties-common
RUN yes | apt-add-repository ppa:developmentseed/mapbox
RUN apt-get update -y 
RUN apt-get upgrade -y 
RUN apt-get install -y tilemill

RUN echo '{"server":true,"listenHost": "0.0.0.0"}' > /etc/tilemillconfig.json
CMD /usr/share/tilemill/index.js start --config=/etc/tilemillconfig.json

EXPOSE 20009 
EXPOSE 20008

