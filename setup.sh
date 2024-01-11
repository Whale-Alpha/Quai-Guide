#!/bin/bash

echo -e ''
echo -e '\e[0;36m'
echo -e '__          ___    _          _      ______ ____  '
echo -e ' \ \        / / |  | |   /\   | |    |  ____|___ \ '
echo -e '  \ \  /\  / /| |__| |  /  \  | |    | |__    __) |'
echo -e '   \ \/  \/ / |  __  | / /\ \ | |    |  __|  |__ < '
echo -e '    \  /\  /  | |  | |/ ____ \| |____| |____ ___) |'
echo -e '     \/  \/   |_|  |_/_/    \_\______|______|____/ '
echo -e '                                                   '
echo -e '\e[0m'
echo -e ''                           
GREEN="\e[32m"
NC="\e[0m"
BINARY=$(uname -m)

#!/bin/bash

exists() {
  command -v "$1" >/dev/null 2>&1
}

is_valid_amount() {
  local re='^[0-9]+$'
  if [[ $1 =~ $re ]] && [ "$1" -gt 4999 ]; then
    return 0
  else
    return 1
  fi
}

if ! exists curl; then
  sudo apt update && sudo apt install curl -y < "/dev/null"
fi

bash_profile=$HOME/.bash_profile
if [ -f "$bash_profile" ]; then
    . $HOME/.bash_profile
fi
cd /root/

rm -rf go-quai

STATS_HOST=stats.colosseum.quai.network/api/v2
QUAI_STATS=true
ENABLE_NAT=true
ip_address=$(dig +short myip.opendns.com @resolver1.opendns.com)

echo "Mevcut IP Adresi: $ip_address"

if [[ -z "$ip_address" ]]; then
    echo "Failed to automatically retrieve the IP address."
    
    while true; do
        read -p "Please enter a valid IP address: " user_ip
        if [[ -n "$user_ip" ]]; then
            ip_address="$user_ip"
            break
        else
            echo "IP address cannot be empty. Please enter a valid IP address."
        fi
    done
fi

while true; do
    read -p "Miner Address: " address
    if [[ -n "$address" ]]; then
        break
    else
        echo "Miner Address cannot be empty. Please enter again."
    fi
done

while true; do
    read -p "Name: " name
    if [[ -n "$name" ]]; then
        break
    else
        echo "Name cannot be empty. Please enter again."
    fi
done

while true; do
    read -p "Password: " password
    if [[ -n "$password" ]]; then
        break
    else
        echo "Password cannot be empty. Please enter again."
    fi
done

sudo apt update && sudo apt upgrade -y
sudo apt install gcc make git libc6-dev   -y
wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz
rm -rf go1.21.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
echo 'export GOROOT=/usr/local/go' >> $HOME/.bash_profile
echo 'export GOPATH=$HOME/go' >> $HOME/.bash_profile
echo 'export GO111MODULE=on' >> $HOME/.bash_profile
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> $HOME/.bash_profile && . $HOME/.bash_profile
git clone https://github.com/dominant-strategies/go-quai
cd go-quai
git checkout v0.28.1
touch network.env
echo '
ZONE_0_0_COINBASE='$address'
ZONE_0_1_COINBASE='$address'
ZONE_0_2_COINBASE='$address'
ZONE_1_0_COINBASE='$address'
ZONE_1_1_COINBASE='$address'
ZONE_1_2_COINBASE='$address'
ZONE_2_0_COINBASE='$address'
ZONE_2_1_COINBASE='$address'
ZONE_2_2_COINBASE='$address'
PRIME_PORT_TCP=30303
PRIME_PORT_HTTP=8546
PRIME_PORT_WS=8547
REGION_0_PORT_TCP=30304
REGION_0_PORT_HTTP=8578
REGION_0_PORT_WS=8579
REGION_1_PORT_TCP=30305
REGION_1_PORT_HTTP=8580
REGION_1_PORT_WS=8581
REGION_2_PORT_TCP=30306
REGION_2_PORT_HTTP=8582
REGION_2_PORT_WS=8583
ZONE_0_0_PORT_TCP=30307
ZONE_0_0_PORT_HTTP=8610
ZONE_0_0_PORT_WS=8611
ZONE_0_1_PORT_TCP=30308
ZONE_0_1_PORT_HTTP=8542
ZONE_0_1_PORT_WS=8643
ZONE_0_2_PORT_TCP=30309
ZONE_0_2_PORT_HTTP=8674
ZONE_0_2_PORT_WS=8675
ZONE_1_0_PORT_TCP=30310
ZONE_1_0_PORT_HTTP=8512
ZONE_1_0_PORT_WS=8613
ZONE_1_1_PORT_TCP=30311
ZONE_1_1_PORT_HTTP=8544
ZONE_1_1_PORT_WS=8645
ZONE_1_2_PORT_TCP=30312
ZONE_1_2_PORT_HTTP=8576
ZONE_1_2_PORT_WS=8677
ZONE_2_0_PORT_TCP=30313
ZONE_2_0_PORT_HTTP=8614
ZONE_2_0_PORT_WS=8615
ZONE_2_1_PORT_TCP=30314
ZONE_2_1_PORT_HTTP=8646
ZONE_2_1_PORT_WS=8647
ZONE_2_2_PORT_TCP=30315
ZONE_2_2_PORT_HTTP=8678
ZONE_2_2_PORT_WS=8679
REGION_0_DOM_URL=ws://127.0.0.1
REGION_1_DOM_URL=ws://127.0.0.1
REGION_2_DOM_URL=ws://127.0.0.1
ZONE_0_0_DOM_URL=ws://127.0.0.1
ZONE_0_1_DOM_URL=ws://127.0.0.1
ZONE_0_2_DOM_URL=ws://127.0.0.1
ZONE_1_0_DOM_URL=ws://127.0.0.1
ZONE_1_1_DOM_URL=ws://127.0.0.1
ZONE_1_2_DOM_URL=ws://127.0.0.1
ZONE_2_0_DOM_URL=ws://127.0.0.1
ZONE_2_1_DOM_URL=ws://127.0.0.1
ZONE_2_2_DOM_URL=ws://127.0.0.1
PRIME_SUB_URLS=ws://127.0.0.1:8579,ws://127.0.0.1:8581,ws://127.0.0.1:8583
REGION_0_SUB_URLS=ws://127.0.0.1:8611,ws://127.0.0.1:8643,ws://127.0.0.1:8675
REGION_1_SUB_URLS=ws://127.0.0.1:8613,ws://127.0.0.1:8645,ws://127.0.0.1:8677
REGION_2_SUB_URLS=ws://127.0.0.1:8615,ws://127.0.0.1:8647,ws://127.0.0.1:8679
SLICES="[0 0],[0 1],[0 2],[1 0],[1 1],[1 2],[2 0],[2 1],[2 2]"
ENABLE_HTTP=true
ENABLE_WS=true
ENABLE_UNLOCK=false
HTTP_ADDR=localhost
WS_ADDR=localhost
WS_API=eth,quai
HTTP_API=quai
NETWORK=colosseum
NONCE=5926993 #Change this along with network
MAX_PEERS=50
ENABLE_NAT=true
EXT_IP='$ip_address'
QUAI_MINING=true
HTTP_CORSDOMAIN="*"
WS_ORIG="*"
BOOTNODE=false
CORS=false
VERBOSITY=4
SYNCMODE=full
NO_DISCOVER=false
QUAI_STATS=true
STATS_NAME='$name'
STATS_PASS='$password'
STATS_HOST='$STATS_HOST'
SHOW_COLORS=true
RUN_BLAKE3=false
DB_ENGINE=leveldb
CUSTOM_DATA_DIR=false
DATA_DIR=' > network.env

make go-quai
make run
tail -f nodelogs/prime.log



