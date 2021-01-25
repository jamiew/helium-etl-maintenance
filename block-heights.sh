echo; echo "blockchain-etl:"
$HOME/blockchain-etl/blockchain_etl info height | awk '{ print $2 }'

echo; echo "etl database:"
echo "select max(block) as height from transactions limit 1;" | /usr/bin/psql etl -P expanded=no

# echo; echo "miner:"
# docker exec miner miner info height

echo; echo "Helium API:"
curl -s https://api.helium.io/v1/stats | jq -r '.data .counts .blocks'

echo
