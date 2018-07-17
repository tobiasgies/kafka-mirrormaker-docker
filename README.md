# kafka-mirrormaker-docker
An [Apache Kafka](https://github.com/apache/kafka) Docker container based on [wurstmeister/kafka-docker](https://github.com/wurstmeister/kafka-docker) that starts a MirrorMaker configurable by environment variables.

* This image is available [on Docker Hub](https://hub.docker.com/r/tobiasgies/kafka-mirrormaker).
* New versions will be released based on wurstmeister's releases.
* Only a subset of MirrorMaker's settings are currently configurable via environment variable.
  If you'd like to add to that set, please [file a ticket](https://github.com/tobiasgies/kafka-mirrormaker-docker/issues)
  and let's discuss – or even better, [create a pull request](https://github.com/tobiasgies/kafka-mirrormaker-docker/pulls)!

## Environment variables in this image:
* `CONSUMER_BOOTSTRAP_SERVERS`: **Mandatory** The list of bootstrap servers for the consumer.
* `CONSUMER_GROUP_ID`: **Mandatory** The consumer's group id, visible in the consumer list on the source server.
* `CONSUMER_AUTO_OFFSET_RESET` The consumer's `auto.offset.reset` setting, by default set to `earliest` (read topic from beginning).
* `PRODUCER_BOOTSTRAP_SERVERS`: **Mandatory** The list of bootstrap servers for the producer.
* `PRODUCER_COMPRESSION_TYPE`: The producer's `compression.type` setting, for setting transfer compression, by default set to `lz4`.
* `WHITELIST`: **Mandatory** The whitelist of topics to be mirrored by this MirrorMaker instance.
* `SLEEP_BEFORE_START`: **Optional** Number of seconds to sleep before starting MirrorMaker. Useful for docker-compose environments.
