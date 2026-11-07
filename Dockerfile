FROM tomcat:9.0-jdk8-temurin

# Copy DigiCraft application into Tomcat
COPY DigiCraft.war /usr/local/tomcat/webapps/ROOT.war

# Expose application port
EXPOSE 8080

# Start Tomcat using Render's assigned port
CMD ["sh", "-c", "sed -i 's/port=\"8080\"/port=\"'\"${PORT:-8080}\"'\"/' \"$CATALINA_HOME/conf/server.xml\" && catalina.sh run"]
