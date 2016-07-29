FROM debian:latest
MAINTAINER  supar "paulrez@gmail.com"

# Build image for the lanbilling web interface project
#

ENV DEBIAN_FRONTEND noninteractive

# Update packages and install the ones that are needed
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y  --no-install-recommends ca-certificates \
                        curl unzip locales git npm \
                        && rm -rf /var/lib/apt/lists/*

RUN echo "Europe/Moscow" > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata
ENV LANG C.UTF-8

RUN npm install -g http-server steal-tools funcunit bower 
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN mkdir -p /opt/jmvc/libs
ENV NODE_PATH /usr/local/lib/node_modules

EXPOSE 80

RUN echo '{ "directory":"libs" }' > /opt/jmvc/.bowerrc
ADD contribs/config.js /opt/jmvc/config.js
ADD contribs/bower.json /opt/jmvc/bower.json

RUN cd /opt/jmvc && bower install --allow-root
RUN npm install -g node-sass

ADD contribs/run.sh /usr/local/bin/run.sh
ADD README.md /README.md
WORKDIR /opt/jmvc
ENTRYPOINT [ "/usr/local/bin/run.sh" ]

