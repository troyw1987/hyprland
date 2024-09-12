MYIP=$(ip -json route get 8.8.8.8 | jq -r '.[].prefsrc')
REIGONINFOJSON=$(curl -s https://ipapi.co/$MYIP/json)


HASERRORED=$(echo $REIGONINFOJSON | jq '.error')

  if [[ $HASERRORED ]]; then
    echo "wttrbar --fahrenheit --hide-conditions --location 'Queen Creek'"
  else
    CITY=$(echo $REIGONINFOJSON | jq '.city')
    echo "wttrbar --fahrenheit --hide-conditions --location '$CITY'"
fi

