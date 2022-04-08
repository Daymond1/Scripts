#!/bin/bash
#node minima cheker
#echo "Підключення до:"$(hostname)
#echo "Дата:"$(date)
#echo "Час роботи серверу:"$(uptime)
status=$(curl -s 127.0.0.1:9142/incentivecash |jq | grep  "status" | sed 's/"status"/Статус/g' | sed 's/,//g')
uid=$(curl -s 127.0.0.1:9142/incentivecash |jq | grep  "uid" | sed 's/"uid"/UID/g' | sed 's/,//g')
ping=$(curl -s 127.0.0.1:9142/incentivecash |jq | grep  "lastPing" | sed 's/"lastPing"/Last Ping/g' | sed 's/,//g')
dailyRewards=$(curl -s 127.0.0.1:9142/incentivecash |jq | grep  "dailyRewards" | sed 's/"dailyRewards"/Монет зібрано/g' | sed 's/,//g')
#echo $status
#echo $uid
#echo $ping
#echo $dailyRewards

#Telegram
Token="YOUR_TOKEN"
Chat="your_chat_id"
URL="https://api.telegram.org/bot$Token/sendMessage"

message="*Стан сервера:*%0A  Підключення до: *$(hostname)*%0A$status%0A  Дата:*$(date)*%0A  Працює:*$(uptime)*%0A    *$uid*%0A *$dailyRewards*%0A*   $ping* "

        curl -s "https://api.telegram.org/bot$Token/sendMessage?chat_id=$Chat&parse_mode=markdown&text=$message" >/dev/null


