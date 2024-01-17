
# Steps

1. Scenario
2. [[Addresses/README|Endereçamento]]
3. [[IGP/README|Configuração IGP (RIP/OSPF)]]
1. [[iBGP/README|Configuração iBGP]]
2. [[eBGP/README|Configuração eBGP]]
3. [[eBGP/README|Configuração MPLS]]
4. [[L3VPN/README|Configuração L3 VPN]]
5. [[QoS/README|Configuração QoS]]

# Requisitos

O estudante deve considerar a seguinte lista de requisitos:

- O endereçamento deve ser otimizado para uma utilização adequada às reais necessidades da rede. Deverão ser configurados endereços link-local em todas as interfaces com IPv6;

- O domínio IGP do ISP Tier 1 deve ter o número de routers suficiente para que seja possível implementar o protocolo OSPFv3 num ambiente multi-area. Valoriza-se a configuração de diversos tipos de áreas;

- O tráfego que sai dos ISPs Tier 3 deve ser encaminhado sempre pelo ISP Tier 2A, sendo apenas as ligações ao ISP Tier 2B utilizada em caso de falha das ligações ao Tier 2A;

- As ligações de Tier 3 para Tier 2 deve assegurar redundância e uso paralelo de links;

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