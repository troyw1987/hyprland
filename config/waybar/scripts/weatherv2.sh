MYCITY=$(curl ifconfig.es/json | jq '.city')


WEATHER="ansiweather -l ${MYCITY} -u imperial -a false -i false -w false -p false -h false"

ANSIOUTPUT=$(eval $WEATHER)
OUTPUT="${ANSIOUTPUT:12}"

echo $OUTPUT
