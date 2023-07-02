# Configuração de VMs com Vagrant

[<img src="https://img.shields.io/badge/linkedin-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white" />](https://www.linkedin.com/in/matheusnatividade/)

Uma poderosa configuração de VMs com o Vagrant para criar ambientes virtuais com endereços IP fixos. Este repositório fornece um Vagrantfile de exemplo que demonstra como criar e provisionar várias máquinas virtuais usando o Vagrant. Além disso, ele configura o Docker Swarm e provisiona os contêineres com base nas configurações fornecidas.

## Recursos

- Cria várias máquinas virtuais com configurações personalizáveis.
- Atribui endereços IP fixos a cada máquina.
- Configura as máquinas virtuais com memória, CPU e nome do host.
- Suporta diferentes providers (VirtualBox, VMware, etc.).
- Provisionamento com Docker e scripts shell adicionais.

## Pré-requisitos

- Vagrant: [Download e Instalação](https://www.vagrantup.com/downloads)
- VirtualBox: [Download e Instalação](https://www.virtualbox.org/wiki/Downloads)

## Clonar o Repositório

```bash
git clone https://github.com/mathnatividade/vms-vagrant.git
cd vms-vagrant
```

## Configurar as Máquinas Virtuais

Abra o arquivo `Vagrantfile` no seu editor de texto favorito e modifique o hash `machines` de acordo com suas necessidades. Cada entrada no hash representa uma máquina virtual e contém informações como memória, CPU, IP e imagem.

```ruby
machines = {
    "master" => {"memory" => "512", "cpu" => "1", "ip" => "100", "image" => "bento/ubuntu-22.04"},
    "node01" => {"memory" => "512", "cpu" => "1", "ip" => "101", "image" => "bento/ubuntu-22.04"},
    "node02" => {"memory" => "512", "cpu" => "1", "ip" => "102", "image" => "bento/ubuntu-22.04"},
    "node03" => {"memory" => "512", "cpu" => "1", "ip" => "103", "image" => "bento/ubuntu-22.04"}
}
```

Certifique-se de ajustar os endereços e a faixa de IP que irá usar, além outros parâmetros de configuração conforme suas preferências, como o provider de virtualização que irá usar.

## Provisionamento e Scripts

O `Vagrantfile` inclui o provisionamento com Docker e scripts shell adicionais. Modifique os scripts de provisionamento conforme necessário ou adicione novos de acordo com suas necessidades.

- ´install-docker.sh´: Instala o Docker nas máquinas virtuais.
- ´swarm-master.sh´: Script específico para a máquina chamada "master", configura o Docker Swarm como um nó mestre.
- ´swarm-worker.sh´: Script específico para as máquinas que não são "master", configura o Docker Swarm como um nó trabalhador.
- ´swarm-init-service.sh´: Script específico para a máquina chamada "master", cria um serviço Docker chamado "webserver" com 15 réplicas usando a imagem "httpd" e configura um volume Docker para compartilhar dados entre os contêineres.

Você pode personalizar esses scripts ou adicionar seus próprios scripts de provisionamento conforme necessário.

## Iniciar as Máquinas Virtuais

Execute o seguinte comando para iniciar as máquinas virtuais:

```bash
vagrant up
```

O Vagrant irá criar e provisionar as máquinas virtuais com base nas configurações especificadas no arquivo `Vagrantfile`. Cada máquina terá seu próprio endereço IP fixo e nome do host.

## Contribuição

Contribuições são bem-vindas! Se você encontrar algum problema ou quiser sugerir melhorias, sinta-se à vontade para abrir uma issue ou criar um pull request.

## Reconhecimentos

Este projeto é inspirado na flexibilidade e conveniência fornecidas pelo Vagrant na criação e gerenciamento de ambientes virtuais.

- [Documentação do Vagrant](https://www.vagrantup.com/docs)
- [Repositório do Vagrant no GitHub](https://github.com/hashicorp/vagrant)
