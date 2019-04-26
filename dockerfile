#FROM ubuntu:16.04
FROM openjdk:11-jre-slim
#FROM openjdk:8-jre-alpine

#RUN peter

RUN apt-get update
#ENV JAVA_HOME=/docker-java-home
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/jre
#ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN apt-get install -y tomcat8
RUN ls /usr/lib/jvm
EXPOSE 80

RUN apt-get install -y maven
RUN apt-get install -y git
RUN mkdir mavenTest
RUN cd mavenTest/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR boxfuse-sample-java-war-hello
RUN mvn package
RUN cp target/hello-1.0.war /var/lib/tomcat8/webapps/
RUN service tomcat8 restart

CMD ["/usr/share/tomcat8/bin/catalina.sh", "run"]
