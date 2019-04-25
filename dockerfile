FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y tomcat8
EXPOSE 80

#RUN apt-get -y install software-properties-common
#RUN add-apt-repository -y ppa:webupd8team/java
#RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
#RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
#RUN apt-get update
#RUN apt-get -y install oracle-java8-installer
#RUN export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
RUN export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN apt-get install -y maven
RUN mkdir mavenTest
RUN cd mavenTest/
RUN apt-get install -y git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN cd boxfuse-sample-java-war-hello
RUN mvn package
RUN cp target/hello-1.0.war /var/lib/tomcat8/webapps/
RUN service tomcat8 restart

ENTRYPOINT ls /usr
