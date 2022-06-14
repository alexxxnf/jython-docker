FROM openjdk:8-jre-alpine3.9

ENV JYTHON_VERSION="2.7.2" \
    JYTHON_HOME="/opt/jython-2.7.2"

RUN apk add --no-cache bash \
  && wget -O jython-installer.jar "http://search.maven.org/remotecontent?filepath=org/python/jython-installer/${JYTHON_VERSION}/jython-installer-${JYTHON_VERSION}.jar" \
  && java -jar jython-installer.jar -s -d "$JYTHON_HOME" \
  && rm -fr "$JYTHON_HOME/Docs" "$JYTHON_HOME/Demo" "$JYTHON_HOME/tests" \
  && rm jython-installer.jar \
  && ln -sfv "$JYTHON_HOME/bin/"* /usr/local/bin/

CMD ["jython"]

