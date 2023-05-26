#!/bin/bash
# Curl command to slack and teams tutorial

WEBHOOK_URL=https://hooks.slack.com/services/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
payload="This is important... I found the hidden treasure!!!"

# Loop through files and run things/ look for stuff
echo Doing stuff

# Find something worth notifying ze team of
echo "I found something... I'll notify the team now."

# Notify the Slack!!
curl -X POST --data-urlencode "payload={\"channel\": \"#treasure_hunting\", \"username\": \"Happy Treasure Hunters\", \"text\": \"$payload\", \"icon_emoji\": \":gem:\"}" "$WEBHOOK_URL"

echo

# # Uh oh are those pirates??
echo "Uh oh..."
payload="I just lost it..."
sleep 5
curl -X POST --data-urlencode "payload={\"channel\": \"#treasure_hunting\", \"username\": \"Sad Treasure Hunters\", \"text\": \"$payload\", \"icon_emoji\": \":pirate_flag:\"}" "$WEBHOOK_URL"
echo

# Notify Teams
html_payload=$(echo $payload | sed -i -r 's/.*/&<br>/' )

curl --write-out %{http_code} -H "Content-Type: application/json" -d "{'title': 'I found something important', 'text':'$html_payload'}" "$WEBHOOK_URL"