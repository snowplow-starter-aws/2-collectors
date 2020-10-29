FROM snowplow/scala-stream-collector-kinesis:1.0.1

COPY config.hocon /snowplow/config/config.hocon

ENTRYPOINT [ "/opt/docker/bin/snowplow-stream-collector" ]
CMD [ "--config", "/snowplow/config/config.hocon"]