#!/bin/bash

echo "*************************************************"
echo "* Settings worker cluster ECS                   *"
echo "*************************************************"
echo

echo ECS_CLUSTER=${CLUSTER_NAME} >> /etc/ecs/ecs.config

cat /etc/ecs/ecs.config

exti 0