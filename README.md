# docker-spy 🕵️
Script in bash, to track event on your container and send the event in your discord webhook

![2023-12-09_14h21_05](https://github.com/StopThatTalace/docker-spy/assets/117742366/a9053a01-0174-4b5a-8119-15fbe3a6d5fb)


## Installing 😼
### 0. git clone the project!
```
git clone https://github.com/StopThatTalace/docker-spy.git
```
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

