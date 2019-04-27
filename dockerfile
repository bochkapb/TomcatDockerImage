FROM tomcat:8

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk

RUN apt-get install -y maven
RUN apt-get install -y git
RUN mkdir mavenTest
RUN cd mavenTest/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR boxfuse-sample-java-war-hello
RUN mvn package
RUN cp target/hello-1.0.war /usr/local/tomcat/webapps/

#CMD ["catalina.sh", "run"]
