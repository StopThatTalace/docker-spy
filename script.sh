#!/bin/bash

DISCORD_WEBHOOK_URL="your_url"
SPECIFIC_CONTAINER_NAMES=("name_container" "name_container")

# Monitor Docker events
docker events --format '{{json .}}' | while read -r event; do
  container_name=$(echo "$event" | jq -r .Actor.Attributes.name)
  status=$(echo "$event" | jq -r .status)

  if [ "$container_name" ]; then
    echo "Container Name: $container_name, Status: $status"

    if [[ "${SPECIFIC_CONTAINER_NAMES[@]}" =~ "$container_name" ]]; then
      if [ "$status" == "start" ]; then
        # Trigger webhook for container start
        curl -X POST -H "Content-Type: application/json" -d '{"content": "Container '"**$container_name**"' started! **[ON]**"}' "$DISCORD_WEBHOOK_URL"
      elif [ "$status" == "die" ]; then
        # Trigger webhook for container stop
        curl -X POST -H "Content-Type: application/json" -d '{"content": "Container '"**$container_name**"' stopped **[OFF]**"}' "$DISCORD_WEBHOOK_URL"
      fi
    fi
  fi
done
