# Author : Heapbytes <Gourav> (https://github.com/heapbytes)
# Ported to consolas + better internet logic + hidden file count : troyw1987

# hidden # of hidden files.
get_hidden_count() {
  local count=$(lsd -A | grep -c '^\.') 
  if [ "$count" -gt 0 ]; then
    echo "%F{242} ($count)%f"
  fi
}

get_ip_address() {
  # Optimized to only run jq once
  local route_info=$(ip -j route get 8.8.8.8 2>/dev/null)
  if [[ -n "$route_info" ]]; then
      local ip=$(echo "$route_info" | jq -r '.[0].prefsrc')
      echo "🌐 $ip"
  else
      echo "⛔"
  fi
}

PROMPT='
┌─[%F{blue}▶ %~%f$(get_hidden_count)] [%F{green}$(get_ip_address)%f] $(git_prompt_info)
╰─🠊 '

RPROMPT='[%F{red}%?%f]'
