FROM wurstmeister/kafka:2.11-1.1.0
COPY resources/docker/bin/entrypoint /usr/bin/entrypoint
ENTRYPOINT /usr/bin/entrypoint
