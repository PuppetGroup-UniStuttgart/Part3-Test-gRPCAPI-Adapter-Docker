echo "Waiting for WAR file to get created"
while [ ! -f /war/generic-adapter.war ]
do
  sleep 2
done
echo "WAR File now available"
