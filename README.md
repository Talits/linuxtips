# linuxtips

Ambiente com três containers em funcionamento, Apache, Mysql e Nagios


Configurações

Comandos usados

docker run -ti idimagem /bin/bash

Link entre serviços:

docker run -d --name db bd/linuxtips 

ID do mysql e depois subir o container do modo abaixo:

docker run -d -p 80:80 --name web --link idcontainer-banco:db apache2 (imagemcomapache e app própria)

Verificando vinculação

root@d6ab967cf38a:/# cat /etc/hosts
172.17.0.4    d6ab967cf38a
127.0.0.1    localhost
::1    localhost ip6-localhost ip6-loopback
fe00::0    ip6-localnet
ff00::0    ip6-mcastprefix
ff02::1    ip6-allnodes
ff02::2    ip6-allrouters
172.17.0.3    db 4229f62d5a7b

172.17.0.4 ---> apache2
172.17.0.4:3306 ---> bd
172.17.0.3-----> nagios na porta 3000

preciso ajustar nagios senha

htpasswd -c /etc/nagios3/htpasswd.users nagiosadmin
New password: 
Re-type new password: 
Adding password for user nagiosadmin

preciso ajustar apache do nagios para ouvir na porta 3000
etc/apache2/ports.conf
e os devidos vhosts
