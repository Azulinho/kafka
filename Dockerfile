FROM openshift/base-centos7
ENV KAFKA_TARGZ=http://www.mirrorservice.org/sites/ftp.apache.org/kafka/1.1.0/kafka_2.12-1.1.0.tgz
RUN mkdir -p /opt/kafka \
  && cd /opt/kafka \
  && yum -y install java-1.8.0-openjdk-headless tar \
  && curl -s $KAFKA_TARGZ | tar -xz --strip-components=1 \
  && yum clean all

RUN chown -R 1001:0 /opt/kafka
USER 1001
WORKDIR /opt/kafka
VOLUME /tmp/kafka-logs /tmp/zookeeper
EXPOSE 2181 2888 3888 9092
