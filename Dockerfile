FROM tomcat:8.0
COPY ./target/hello-world-war-1.0.0.war /usr/local/tomcat/webapps/
