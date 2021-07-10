FROM confluentinc/cp-kafka:6.2.0

USER root

# Create group and user kafka-helper
RUN groupadd kafka-helper
RUN useradd --gid kafka-helper --create-home kafka-helper

# change file owner and group of /kafka-helper/bin
RUN chown -R kafka-helper:kafka-helper /home/kafka-helper

USER kafka-helper

COPY bin /home/kafka-helper/bin
ENV PATH /home/kafka-helper/bin:$PATH
WORKDIR /home/kafka-helper/bin
