FROM openjdk:alpine

ENV STUBBY4J_VERSION=6.0.1
ENV SERVER_BIND_ADDRESS=0.0.0.0
ENV STUBS_PORT=8882
ENV ADMIN_PORT=8889

COPY stubby4j.yml /usr/local/stubby4j/data/stubby4j.yml

RUN wget "http://search.maven.org/remotecontent?filepath=io/github/azagniotov/stubby4j/$STUBBY4J_VERSION/stubby4j-$STUBBY4J_VERSION.jar" -O "/usr/local/stubby4j/stubby4j-$STUBBY4J_VERSION.jar"

CMD java -jar /usr/local/stubby4j/stubby4j-$STUBBY4J_VERSION.jar --admin $ADMIN_PORT --data /usr/local/stubby4j/data/stubby4j.yml --location $SERVER_BIND_ADDRESS --stubs $STUBS_PORT --watch $EXTRA_ARGS
