#!/bin/bash

DISCORD_WEBHOOK_URL="YOUR_DISCORD_WEBHOOK_URL"
CONTAINER_A="your_specific_container_name_1"
CONTAINER_B="your_specific_container_name_2"

docker events --format '{{json .}}' | while read -r event; do
  container_name=$(echo "$event" | jq -r .Actor.Attributes.name)

  if [ "$container_name" == "$SPECIFIC_CONTAINER_NAME_1" ] || [ "$container_name" == "$SPECIFIC_CONTAINER_NAME_2" ]; then
    status=$(echo "$event" | jq -r .status)

    if [ "$status" == "start" ]; then
      # Trigger webhook for container start
      curl -X POST -H "Content-Type: application/json" -d '{"content": "Container '"$container_name"' started!"}' "$DISCORD_WEBHOOK_URL"
    elif [ "$status" == "die" ]; then
      # Trigger webhook for container stop
      curl -X POST -H "Content-Type: application/json" -d '{"content": "Container '"$container_name"' stopped."}' "$DISCORD_WEBHOOK_URL"
    fi
  fi
done

