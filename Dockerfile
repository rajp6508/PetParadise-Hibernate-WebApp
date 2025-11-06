# Use official Tomcat base image
FROM tomcat:9.0-jdk17

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your project files to Tomcat's webapps folder
COPY WebContent/ /usr/local/tomcat/webapps/ROOT/

# Expose default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
