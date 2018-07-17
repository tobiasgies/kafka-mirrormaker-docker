FROM wurstmeister/kafka:2.11-1.1.0
COPY scripts/docker-mm-entrypoint.sh /bin/docker-mm-entrypoint.sh
ENTRYPOINT /bin/docker-mm-entrypoint.sh