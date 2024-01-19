
# Steps

1. Scenario
2. [[Addresses/README|Endereçamento]]
3. [[IGP/README|Configuração IGP (RIP/OSPF)]]
1. [[BGP/iBGP/README|Configuração iBGP]]
2. [[BGP/eBGP/README|Configuração eBGP]]
4. [[L3VPN/README|Configuração L3 VPN]]
5. [[QoS/README|Configuração QoS]]

###  TODO

- BGP **next-hop-self** em links do mesmo AS 
- Links paralelos (port-channels) entre T2 e T3
- BGP PREFERENCIAL (MED, etc)
	- PREFERENCIAL PARA 1000 DE AS 2001 **f1/1** (LINK PRIORITY)
	- PREFERENCIAL PARA 1000 DE AS 2002 **R-2002-A (f0/0)** (MED)
	- Preferencial de 3001 para 2001 **f0/1**
	- (3001, 3002) Rerouting para AS 2002 se 2001 falhar (MED)
- Route reflector
- L3VPN
- QoS
# Requisitos

O estudante deve considerar a seguinte lista de requisitos:

- O endereçamento deve ser otimizado para uma utilização adequada às reais necessidades da rede. Deverão ser configurados endereços link-local em todas as interfaces com IPv6;

- O domínio IGP do ISP Tier 1 deve ter o número de routers suficiente para que seja possível implementar o protocolo OSPFv3 num ambiente multi-area. Valoriza-se a configuração de diversos tipos de áreas;

- O tráfego que sai dos ISPs **Tier 3 deve ser encaminhado sempre pelo ISP Tier 2A**, sendo apenas as ligações ao **ISP Tier 2B utilizada em caso de falha** das ligações ao Tier 2A;

- As ligações de **Tier 3 para Tier 2 deve assegurar redundância e uso paralelo de links**;

- Nas ligações Tier 1 a qualquer um dos Tier 2 deve ser sempre definido um link preferencial;

- Para o ISP Tier 1 a implementação de BGP deve assegurar um número de ligações iBGP reduzida de forma que o crescimento de routers no ISP não implique um crescimento exponencial dessas mesmas ligações e valoriza-se o uso de confederações

- O Tier 2A implementa QoS;

- Para a criação do cliente empresarial, devem ser tidas em conta as seguintes considerações:
	- Utilização de endereçamento privado;
	- O cliente empresarial utiliza atualmente apenas endereçamento IPv4;
	- Os sites da empresa devem estar ligados através de uma VPN L3, sobre a tecnologia MPLS;
	- Na conetividade da filial com os routers PE do operador deverá ser considerado os protocolos identificados na figura 1;
	- A conetividade à internet para qualquer equipamento dentro da empresa deve ser assegurada através do router da Sede;
	- O cliente empresarial implementa QoS.


---
# INFO
Esta indicação destina-se apenas a quem tem no projeto a seguinte situação:  
- No Tier 1, a ligação eBGP para os Tier 2A ou Tier 2B é feita a partir de um router que se encontra numa área OSPF do tipo Stub, Totally Stub ou NSSA.  
  
Solução:  
- Para estes casos, a rota estática usada no BGP (por exemplo: ip route 130.0.0.0 255.255.0.0 Null0) deve ser alterada para: "ip route 130.0.0.0 255.255.0.0 130.0.2.2", considerando que 130.0.2.2 é o IP da interface do router que interliga as áreas zero e NSSA (por exemplo) e que liga ao router que tem a ligação eBGP.  
- na configuração do BGP mantêm o comando "redistribute static". No BGP não é necessário usar o comando network.  
  
  
Esta situação acontece porque na tabela de encaminhamento dos routers que estão nas áreas OSPF referidas acima existe uma rota default. Ao acrescentarmos a rota estática, esta tem precedência sobre a rota default e provoca que alguns pacotes possam ser eliminados em vez de serem encaminhados para o seu destino.