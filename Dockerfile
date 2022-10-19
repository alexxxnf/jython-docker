FROM adoptopenjdk/openjdk11:jdk-11.0.11_9-alpine

ENV JYTHON_VERSION="2.7.3" \
    JYTHON_HOME="/opt/jython-2.7.3"

RUN apk add --no-cache bash \
  && wget -O jython-installer.jar "http://search.maven.org/remotecontent?filepath=org/python/jython-installer/${JYTHON_VERSION}/jython-installer-${JYTHON_VERSION}.jar" \
  && java -jar jython-installer.jar -s -d "$JYTHON_HOME" \
  && rm -fr "$JYTHON_HOME/Docs" "$JYTHON_HOME/Demo" "$JYTHON_HOME/tests" \
  && rm jython-installer.jar \
  && ln -sfv "$JYTHON_HOME/bin/"* /usr/local/bin/

CMD ["jython"]

