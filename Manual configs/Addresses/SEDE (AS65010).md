## R-SEDE-A

```c
conf t
!
int l0
 ip add 192.168.254.1 255.255.255.255
 no sh
!
int f0/0
 desc TO R-2001-D (f1/0)
 ip add 131.0.100.2 255.255.255.252
 no sh
!
int f0/1
 desc INSIDE
 ip add 192.168.10.1 255.255.255.0
 no sh
!
ip dhcp excluded-address 192.168.10.1
ip dhcp excluded-address 192.168.10.2
!
ip dhcp pool LAN_SEDE
 network 192.168.10.0 255.255.255.0
 default-router 192.168.10.1
 dns-server 131.0.255.1
!
end
!

```

## R-SEDE-B

```c
conf t
!
int l0
 ip add 192.168.254.2 255.255.255.255
 no sh
!
int f0/0
 desc INSIDE
 ip add 192.168.10.2 255.255.255.0
 no sh
!
int f0/1
 desc TO R-2001-C (f1/1)
 ip add 131.0.150.2 255.255.255.252
 no sh
!
end
!

```