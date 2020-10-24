#!/usr/bin/dumb-init /bin/sh
set -e

## If the config directory has been mounted through -v, we chown it.
if [ "$(stat -c %u ${SNOWPLOW_CONFIG_PATH})" != "$(id -u snowplow)" ]; then
  chown snowplow:snowplow ${SNOWPLOW_CONFIG_PATH}
fi

## Make sure we run the collector as the snowplow user
# -> pass -Dcom.amazonaws.sdk.disableCbor in order to get around the jackson version problem
# -> pass --config /snowplow/config/config.hocon
exec su-exec snowplow:snowplow /usr/bin/java \
    $SP_JAVA_OPTS -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap \
    -Dcom.amazonaws.sdk.disableCbor \
    -cp "${SNOWPLOW_BIN_PATH}/snowplow-stream-collector-${PLATFORM}-${COLLECTOR_VERSION}.jar:/snowplow/libs/*" \
     com.snowplowanalytics.snowplow.collectors.scalastream.KinesisCollector --config /snowplow/config/config.hocon
