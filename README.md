# docker-spy
Script in bash, that track event on your container and send the event in your discord webhook

## Installing
### 1. Install jq tool
```
sudo apt-get install jq
```
### 2. Configure your variable
```
DISCORD_WEBHOOK_URL="YOUR_DISCORD_WEBHOOK_URL"
CONTAINER_A="your_specific_container_name_1"
CONTAINER_B="your_specific_container_name_2"
```
### 3. Configure Docker to output events!
```
docker events --format '{{json .}}'
```
