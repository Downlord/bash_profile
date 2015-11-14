#!/bin/bash

alias kcat="kafkacat -b $KAFKA_BROKER_LIST"
alias kcon="/opt/kafka/bin/kafka-console-consumer.sh --zookeeper $ZOOKEEPER_URI --topic $@"
alias kprod="/opt/kafka/bin/kafka-console-producer.sh --broker-list $KAFKA_BROKER_LIST --topic $@"
alias ktopic="/opt/kafka/bin/kafka-topics.sh --zookeeper $ZOOKEEPER_URI $@"
