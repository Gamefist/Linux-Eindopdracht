# Linux-Eindopdracht

## Rsyslog.sls
default.conf bevat de aangepaste ryslog.conf met de regel: '*\.\* @@10.0.6.140' toegevoegd aan het einde. Deze wordt vervolgens overgekopieerd om de configuratie te voltooien en de service wordt herstart.

## Munin.sls
default.conf bevat de aangepaste munin-node.conf met de regel: 'allow ^10\.0\.6\.141' erin. Deze wordt vervolgens overkopieerd om de configuratie te voltooien en de service wordt herstart.

## startup
Het startup bestand is aangevuld met de volgende commando's (Uitgevoerd vanaf /etc/init.d):  
sudo chmod 777 startup  
sudo update-rc.d startup defaults  
sudo update-rc.d startup enable  
Dit script zal dus vervolgens runnen bij het opstarten van de machine en het /home/dennis/installSalt.sh script aanroepen

## installSalt.sh
Dit script installeert de salt minion op de machine, voegt de master en id variabelen toe aan het config bestand en herstart deze service vervolgens. 
