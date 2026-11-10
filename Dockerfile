
FROM tomcat:9.0-jre8-temurin

RUN sed -i 's/port="8080"/port="10000"/' /usr/local/tomcat/conf/server.xml

COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

COPY tidb-truststore.jks /usr/local/tomcat/conf/tidb-truststore.jks

EXPOSE 10000

CMD ["catalina.sh", "run"]
