#!/bin/bash

DISCORD_WEBHOOK_URL="your_webhook"
SPECIFIC_CONTAINER_NAMES=("your_container" "your_container")

# Monitor Docker events
docker events --format '{{json .}}' | while read -r event; do
  container_name=$(echo "$event" | jq -r .Actor.Attributes.name)
  status=$(echo "$event" | jq -r .status)

  if [ "$container_name" ]; then

    if [[ "${SPECIFIC_CONTAINER_NAMES[@]}" =~ "$container_name" ]]; then
      days=$(date +"%d/%m")
      hours=$(date +"%H:%M")

      if [ "$status" == "start" ]; then
        # Trigger webhook for container start
        curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"✅️ - **[Started]** the **$days** at **$hours** - Container **$container_name**\"}" "$DISCORD_WEBHOOK_URL"
      elif [ "$status" == "die" ]; then
        # Trigger webhook for container stop with formatted date
        curl -X POST -H "Content-Type: application/json" -d "{\"content\": \":no_entry: - **[Stopped]** the **$days** at **$hours** - Container **$container_name**\"}" "$DISCORD_WEBHOOK_URL"
      fi
    fi
  fi
done