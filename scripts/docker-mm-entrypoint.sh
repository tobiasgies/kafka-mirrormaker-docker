#!/usr/bin/env bash

consumer_config_file="/opt/kafka/config/docker-mm-consumer.properties"
producer_config_file="/opt/kafka/config/docker-mm-producer.properties"

if [ -z "${CONSUMER_BOOTSTRAP_SERVERS}" ]; then
    echo "ERROR: consumer bootstrap servers must be set."
    exit 64
fi
if [ -z "${CONSUMER_GROUP_ID}" ]; then
    echo "ERROR: consumer group id must be set."
    exit 64
fi
if [ -z "${CONSUMER_AUTO_OFFSET_RESET}" ]; then
    echo "WARNING: Setting consumer auto.offset.reset to 'earliest' by default."
    CONSUMER_AUTO_OFFSET_RESET="earliest"
fi
if [ -z "${PRODUCER_BOOTSTRAP_SERVERS}" ]; then
    echo "ERROR: producer bootstrap servers must be set."
    exit 64
fi
if [ -z "${PRODUCER_COMPRESSION_TYPE}" ]; then
    echo "WARNING: Setting producer compression.type to 'lz4' by default."
    PRODUCER_COMPRESSION_TYPE="lz4"
fi
if [ -z "${WHITELIST}" ]; then
    echo "ERROR: A topic whitelist must be set."
    exit 64
fi

cat <<- EOF > ${consumer_config_file}
bootstrap.servers=${CONSUMER_BOOTSTRAP_SERVERS}
auto.offset.reset=${CONSUMER_AUTO_OFFSET_RESET}
group.id=${CONSUMER_GROUP_ID}
EOF

cat <<- EOF > ${producer_config_file}
bootstrap.servers=${PRODUCER_BOOTSTRAP_SERVERS}
compression.type=${PRODUCER_COMPRESSION_TYPE}
EOF

if [ -n "${SLEEP_BEFORE_START}" ]; then
    echo "INFO: Sleeping ${SLEEP_BEFORE_START} seconds before starting MirrorMaker."
    sleep ${SLEEP_BEFORE_START}
fi

/opt/kafka/bin/kafka-mirror-maker.sh \
    --consumer.config ${consumer_config_file} \
    --producer.config ${producer_config_file} \
    --whitelist ${WHITELIST}
