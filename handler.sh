function hello () {
  EVENT_DATA=$1
  echo "$EVENT_DATA" 1>&2;

  LS_OUT=$(ls /usr/bin)

  RESPONSE="{\"body\": {\"input\": ${EVENT_DATA}, \"msg\": \"Wecome to serverless!\", \"ls\": \"${LS_OUT}\"}}"

  echo $RESPONSE
}
