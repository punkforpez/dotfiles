#!/run/current-system/sw/bin/bash
ip a | grep -q 'wg0-mullvad' \
&& echo '{"text":"Connected","class":"connected","percentage":100}' \
|| echo '{"text":"Disconnected","class":"disconnected","percentage":0}'

