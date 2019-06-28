#! /bin/sh


pause()
{
	read -p "Press Enter to continue" </dev/tty

}

USER='pamAdmin:redhatpam1!'
export BASEURL="http://localhost:8080/kie-server/services/rest/server/containers/instances/Demo1"

if [ "$1" == "" ]; then

echo "\nSet up device statues, all good..."
pause
curl -X POST -H 'X-KIE-ContentType: JSON' -H 'Content-type: application/json' -u $USER \
-d '{
"lookup":"alertStateful",
  "commands" : [ {
    "insert" : {
      "object" : {"com.myspace.demo1.Switch": {
      "site" : "CYD",
      "assetType" : "CB",
      "asset_id" : 552,
      "attribute" : "POS",
      "value" : true,
      "dateTime" : "2019-06-27T16:10:30"
      }
    }}}, {
    "insert" : {
      "object" : {"com.myspace.demo1.Switch": {
      "site" : "CYD",
      "assetType" : "DIS",
      "asset_id" : 556,
      "attribute" : "POS",
      "value" : true,
      "dateTime" : "2019-06-27T16:10:30"
      }
    }}}, {
    "insert" : {
      "object" : {"com.myspace.demo1.Switch": {
      "site" : "CYD",
      "assetType" : "DIS",
      "asset_id" : 553,
      "attribute" : "POS",
      "value" : true,
      "dateTime" : "2019-06-27T16:10:30"
      }
    }}}, {
    "insert" : {
      "object" : {"com.myspace.demo1.Switch": {
      "site" : "CYD",
      "assetType" : "DIS",
      "asset_id" : 555,
      "attribute" : "POS",
      "value" : true,
      "dateTime" : "2019-06-27T16:10:30"
      }
    }}}, {
      "fire-all-rules" : ""
  } ]
}' \
$BASEURL

fi

echo "\nAbout to cause an alert..."
pause
curl -X POST -H 'X-KIE-ContentType: JSON' -H 'Content-type: application/json' -u $USER \
-d '{
"lookup":"alertStateful",
  "commands" : [{
    "insert" : {
      "object" : {"com.myspace.demo1.Switch": {
      "site" : "CYD",
      "assetType" : "CB",
      "asset_id" : 552,
      "attribute" : "POS",
      "value" : false,
      "dateTime" : "'$(date +%FT%T)'"
      }
    }}}, 
    {
      "fire-all-rules" : ""
  },  {"query":{"out-identifier":"$alert","name":"get alerts"}} ]
}' \
$BASEURL

echo "\nAbout to remove an alert..."
pause
curl -X POST -H 'X-KIE-ContentType: JSON' -H 'Content-type: application/json' -u $USER \
-d '{
"lookup":"alertStateful",
  "commands" : [{
    "insert" : {
      "object" : {"com.myspace.demo1.Switch": {
      "site" : "CYD",
      "assetType" : "CB",
      "asset_id" : 552,
      "attribute" : "POS",
      "value" : true,
      "dateTime" : "'$(date +%FT%T)'"
      }
    }}}, 
    {
      "fire-all-rules" : ""
  },   {"query":{"out-identifier":"$alert","name":"get alerts"} 
  } ]
}' \
$BASEURL

