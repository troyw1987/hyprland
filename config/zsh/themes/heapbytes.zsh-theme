#Author : Heapbytes <Gourav> (https://github.com/heapbytes)
#Ported to consolas + better internet logic : troyw1987

PROMPT='
┌─[%F{blue}▶ %~%f] [%F{green}$(get_ip_address)%f] $(git_prompt_info)
╰─🠊 '

RPROMPT='[%F{red}%?%f]'

get_ip_address() {

  IPCHECK=$(ip -json route get 8.8.8.8 2> /dev/null | jq -r '.[].dst' | cut -c1-1)

  if [ $IPCHECK -eq "8" 2> /dev/null ]; then
      proompt="$(ip -json route get 8.8.8.8 | jq -r '.[].prefsrc')"
      echo "🌐" $proompt

      return
  fi

  echo "⛔"


}
