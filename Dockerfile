FROM snowplow/scala-stream-collector-kinesis:1.0.1

COPY config.hocon /snowplow/config/config.hocon

#RUN echo 'export $(strings /proc/1/environ | grep AWS_CONTAINER_CREDENTIALS_RELATIVE_URI)' >> /root/.profile
COPY  --chown=snowplow:root aws-java-sdk-sts-1.11.887.jar /opt/docker/lib/aws-java-sdk-sts-1.11.887.jar
#RUN chown snowplow /opt/docker/lib/com.amazonaws.aws-java-sdk-sts-1.11.887.jar

#COPY --chown=snowplow:rootdir:fd282db9fb50ca19b3f4f887be4d0c167deaed1ed20a422ae98fa8a79191b1dd in /opt/docker

ENTRYPOINT [ "/opt/docker/bin/snowplow-stream-collector" ]
CMD [ "--config", "/snowplow/config/config.hocon"]