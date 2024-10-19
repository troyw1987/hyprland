MYCITY=$(curl ifconfig.es/json | jq '.city')
WEATHER="ansiweather -l ${MYCITY} -u imperial -a false -i false -w false -p false -h false"
ANSIOUTPUT=$(eval "$WEATHER")

SUBSIZE=${#ANSIOUTPUT}-3
OUTPUT="${ANSIOUTPUT:12:SUBSIZE}"

if [ "${OUTPUT:2:5}" == "fetch" ]; then
  echo "󰅣 "
else
  echo "󰅟 $OUTPUT"
fi
