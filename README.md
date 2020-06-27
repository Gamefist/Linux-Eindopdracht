# Linux-Eindopdracht

# Rsyslog.sls
default.conf bevat de aangepaste ryslog.conf met de regel: *.* @@10.0.6.140 toegevoegd aan het einde. Deze wordt vervolgens overgekopieerd om de configuratie te voltooien en de service wordt herstart.

# Munin.sls
default.conf bevat de aangepaste munin-node.conf met de regel: allow ^10\.0\.6\.141 erin. Deze wordt vervolgens overkopieerd om de configuratie te voltooien en de service wordt herstart.
