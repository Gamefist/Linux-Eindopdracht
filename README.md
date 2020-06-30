# Linux-Eindopdracht

## scripts folder
Deze folder bevat alle bestanden die onder /srv/salt/scripts vallen

### docker.sh
Dit bash script installeert docker en configureert deze op een server

### wordpress.sh
Dit bash script installeert wordpress, mysql, php, apache2 en configureert deze op een server

## serverscripts folder

### autoclean_docker & autoclean_wordpress
Deze bash scripts heb ik gemaakt om snel deze servers op te schonen voor demo redenen

### startup
Het startup bestand is aangevuld met de volgende commando's (Uitgevoerd vanaf /etc/init.d):  
sudo chmod 777 startup  
sudo update-rc.d startup defaults  
sudo update-rc.d startup enable  
Dit script zal dus vervolgens runnen bij het opstarten van de machine en het /home/dennis/installSalt.sh script aanroepen

### installSalt.sh
Dit script installeert de salt minion op de machine, voegt de master en id variabelen toe aan het config bestand en herstart deze service vervolgens. 

## rsyslog.sls
default.conf bevat de aangepaste ryslog.conf met de regel: '*\.\* @@10.0.6.140' toegevoegd aan het einde. Deze wordt vervolgens overgekopieerd om de configuratie te voltooien en de service wordt herstart.

## munin.sls
default.conf bevat de aangepaste munin-node.conf met de regel: 'allow ^10\.0\.6\.141' erin. Deze wordt vervolgens overkopieerd om de configuratie te voltooien en de service wordt herstart.

## docker.sls
Deze state voert het bash script docker.sh uit op een minion

## wordpress.sls
Deze state voert het bash script wordpress.sh uit op een minion

## update.sls 
Deze state voert sudo apt-get update & sudo apt-get upgrade uit op een minion

## top.sls
Dit bestand bevat alle states en voert ze op de juiste minions uit (Word standaard uitgevoerd bij een High-State)
