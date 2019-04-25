FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y tomcat8
EXPOSE 80
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get install -y oracle-java8-installer
RUN export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
RUN apt install -y maven
RUN mkdir mavenTest
RUN cd mavenTest/
RUN apt install -y git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN cd boxfuse-sample-java-war-hello
RUN mvn package
RUN cp target/hello-1.0.war /var/lib/tomcat8/webapps/
RUN service tomcat8 restart

ENTRYPOINT ls /usr
