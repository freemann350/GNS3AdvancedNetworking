## R-SEDE-A

```c
conf t
!
int l0
 ip add 192.168.254.1 255.255.255.255
 ipv6 add 2221:2566:6:1111::A/128
 ipv6 add FE80::CEDE:A:1 link-local
 no sh
!
int f0/0
 desc TO R-2001-D (f1/0)
 ip add 131.0.100.2 255.255.255.252
 ipv6 add 2221:2566:2:12::2/64
 ipv6 add FE80::2001:CEDE:1 link-local
 no sh
!
int f0/1
 desc INSIDE
 ip add 192.168.10.1 255.255.255.0
 ipv6 add 2221:2566:1111:1::1/64
 ipv6 add FE80::CEDE:1 link-local
 no sh
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
 ipv6 add 2221:2566:6:1111::B/128
 ipv6 add FE80::CEDE:B:1 link-local
 no sh
!
int f0/0
 desc INSIDE
 ip add 192.168.10.2 255.255.255.0
 ipv6 add 2221:2566:1111:1::2/64
 ipv6 add FE80::CEDE:2 link-local
 no sh
!
int f0/1
 desc TO R-2001-C (f1/1)
 ip add 131.0.150.2 255.255.255.252
 ipv6 add 2221:2566:2:11::2/64
 ipv6 add FE80::2001:CEDE:1 link-local
 no sh
!
end
!

```