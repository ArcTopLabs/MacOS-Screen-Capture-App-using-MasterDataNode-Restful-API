#!/bin/sh
#please make this make file executable using : chmod u+x .....
  
echo "Call to 'demo' App to capture screenshot"
echo "Capture Image running process"

screencapture -T 5 -x image.jpg

imagedata="data:image/jpeg;base64,$(cat image.jpg | base64 | tr -d \\n)"
date="$(date)"
echo $date
whoami="$(whoami)"

appname="######appName######"
dataset="img"
token="######access_token######"
HOST="http://api.masterdatanode.com/$appname/$dataset/save/"
curl -H "access_token:$token" -H "Content-Type: application/json" -d @- "$HOST" <<CURL_DATA
{ "data" : [{ "date" : "$date", "whoami" : "$whoami" , "tag" : "$whoami", "imageData" : "$imagedata"}]}
CURL_DATA

