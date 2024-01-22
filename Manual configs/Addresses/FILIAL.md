## R-FILIAL

```c
conf t
!
int l0
 ip add 192.168.255.1 255.255.255.255
 no sh
!
int f0/0
 desc TO R-2001-A (f1/0)
 ip add 131.0.200.2 255.255.255.252
 no sh
!
int f0/1
 desc INSIDE
 ip add 192.168.20.1 255.255.255.0
 no sh
!
ip dhcp pool LAN_FILIAL
 network 192.168.20.0 255.255.255.0
 default-router 192.168.20.1
 dns-server 131.0.255.1
!
end
!

```
Viva moço, epá não queria estar a chatear mas tou com uma foda no router A da sede que comunica com o exterior por Internet. Eu tenho o default route lá, mas o IP da interface da rede interna (192.168.10.1) não comunica com o exterior, contudo a interface da rede externa (131.0.100.2) trabalha bem. Tenho default-information originate tanto no OSPF como no BGP e não faz nada. Alguma ideia?

