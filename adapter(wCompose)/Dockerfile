FROM maven:3.3-jdk-8

ENV TOMCAT_VERSION 7.0.59
ENV TOMCAT_URL http://archive.apache.org/dist/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
ENV CATALINA_HOME /opt/tomcat

ENV DEBIAN_FRONTEND noninteractive
ENV PATH ${PATH}:${HOME}/.m2/repository:${CATALINA_HOME}/bin
		
# Install and configure dependencies
RUN apt-get update && apt-get clean

# Install tomcat
RUN wget ${TOMCAT_URL} -O /tmp/catalina.tar.gz && \
        tar -zxf /tmp/catalina.tar.gz -C /opt && \
        ln -s /opt/apache-tomcat-${TOMCAT_VERSION} ${CATALINA_HOME} && \
        rm /tmp/catalina.tar.gz
		
# Remove unneeded stuff
RUN rm -rf ${CATALINA_HOME}/webapps/examples && rm -rf ${CATALINA_HOME}/webapps/docs

# Replace 'random' with 'urandom' for quicker startups
RUN rm /dev/random && ln -s /dev/urandom /dev/random

COPY proto-check.sh /
RUN chmod +x /proto-check.sh

WORKDIR /

RUN apt-get install -y git
RUN git clone https://github.com/shruthikuki/UniStuttgart-PuppetGroup-Adapter.git	

WORKDIR /UniStuttgart-PuppetGroup-Adapter

EXPOSE 8080

COPY settings.xml /

CMD /./proto-check.sh; ls /api; echo "Copying main.proto file to local"; cp /api/main.proto /UniStuttgart-PuppetGroup-Adapter/src/main/proto; ls /UniStuttgart-PuppetGroup-Adapter/src/main/proto; cd /UniStuttgart-PuppetGroup-Adapter; mvn clean install -gs /settings.xml; chmod 777 /UniStuttgart-PuppetGroup-Adapter/target/generic-adapter.war; echo "ls -ls /UniStuttgart-PuppetGroup-Adapter/target"; ls -ls /UniStuttgart-PuppetGroup-Adapter/target; echo "Copying WAR to webapps"; ls /UniStuttgart-PuppetGroup-Adapter/target; mv /UniStuttgart-PuppetGroup-Adapter/target/generic-adapter.war ${CATALINA_HOME}/webapps; echo "Copy done"; ls -ls ${CATALINA_HOME}/webapps/; echo "Starting Tomcat"; catalina.sh run