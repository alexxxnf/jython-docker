# syntax=docker/dockerfile:experimental
FROM openjdk:8-jdk-alpine3.9 as builder

RUN apk add --no-cache apache-ant
RUN mkdir -p /usr/src \
  && wget "https://github.com/jython/jython/tarball/master" -q -O - | tar -xz -C /usr/src \
  && mv /usr/src/jython-* /usr/src/jython-master \
  && cd /usr/src/jython-master \
  && ant installer


FROM openjdk:8-jre-alpine3.9

ENV JYTHON_HOME="/opt/jython"

RUN --mount=type=bind,from=builder,source=/usr/src/jython-master/dist/jython-installer.jar,target=/jython-installer.jar \
  apk add --no-cache bash \
  && java -jar /jython-installer.jar -s -d "$JYTHON_HOME" -i mod ensurepip -e demo \
  && rm -rf "$JYTHON_HOME/tests" \
  && ln -sfv "$JYTHON_HOME/bin/"* /usr/local/bin/

CMD ["jython"]
