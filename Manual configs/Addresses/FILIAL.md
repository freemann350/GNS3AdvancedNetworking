## R-FILIAL

```c
conf t
!
int l0
 ip add 192.168.255.1 255.255.255.255
 ipv6 add 2221:2566:7:2222::A/128
 ipv6 add FE80::FA:A:1 link-local
 no sh
!
int f0/0
 desc TO R-2001-A (f1/0)
 ip add 131.0.200.2 255.255.255.252
 ipv6 add 2221:2566:2:10::2/64
 ipv6 add FE80::FA:1 link-local
 no sh
!
int f0/1
 desc INSIDE
 ip add 192.168.20.1 255.255.255.0
 ipv6 add 2221:2566:2222:1::1/64
 ipv6 add FE80::2001:FA:2 link-local
 no sh
!
end
!

```
