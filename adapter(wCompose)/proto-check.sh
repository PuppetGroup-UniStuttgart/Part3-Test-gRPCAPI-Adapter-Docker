echo "Waiting for main.proto file to become available"
while [ ! -f /api/main.proto ]
do
  sleep 2
done
echo "main.proto file now available"

