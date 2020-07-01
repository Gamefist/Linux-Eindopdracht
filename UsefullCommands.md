### Logger
logger <Text to log>  
sudo cat /var/log/syslog | grep -e "Wordpress" -e "Docker"

### Salt Master
sudo salt '*' test.ping  
sudo salt-key --list-all  
sudo salt-key --accept-all  
sudo salt-key -d <key to delete>  

### Docker
docker run -it ubuntu  
