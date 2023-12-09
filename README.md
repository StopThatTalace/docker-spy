# docker-spy 🕵️
Script in bash, to track event on your container and send the event in your discord webhook

![2023-12-09_14h18_17](https://github.com/StopThatTalace/docker-spy/assets/117742366/b4a90d2a-5599-4d71-bfee-d4643151d3d7)

## Installing 😼
### 1. Install jq tool
```
sudo apt-get install jq
```
### 2. Configure your variable
```
DISCORD_WEBHOOK_URL="YOUR_DISCORD_WEBHOOK_URL"
SPECIFIC_CONTAINER_NAMES=("name_container" "name_container")
```
### 3. Lunch the script
```
chmod +x script.sh

./script.sh
```

### 3.1 [OPTION] Lunch the script in the background
```
nohup ./your_script.sh &
```

