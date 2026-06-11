# Docker com Vagrant e Ansible

Projeto da disciplina **Administração de Sistemas Abertos** — IFPB Campus João Pessoa.

**Integrantes:** Haniel e Kauê 

---

## Descrição

Provisionamento automático de um servidor WordPress utilizando **Vagrant**, **Ansible** e **Docker**, com Nginx como proxy reverso TCP

## Fluxo do Projeto

```
Vagrantfile → playbook_ansible.yml → docker-compose.yml
```

1. O **Vagrantfile** cria a VM e chama o Ansible
2. O **Ansible** atualiza o sistema, instala o Docker e sobe os containers
3. O **Docker Compose** cria os 3 containers (webproxy, webserver, database)

## Pré-requisitos

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)
- [Git](https://git-scm.com/)

## Como executar

```bash
git clone https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
cd SEU_REPOSITORIO
vagrant up
```

Após o provisionamento, acesse no navegador:

```
http://192.168.56.159:8080
```

## Estrutura do Projeto

```
.
├── Vagrantfile
├── playbook_ansible.yml
├── Dockerfile
└── docker-compose.yml
```

## Containers

| Container | Imagem | Função |
|-----------|--------|--------|
| webproxy | nginx personalizado | Proxy TCP camada 4 (porta 8080) |
| webserver | wordpress:latest | Aplicação WordPress |
| database | mysql:latest | Banco de dados MySQL |

## Infraestrutura da VM

| Configuração | Valor |
|---|---|
| Provider | VirtualBox |
| Box | debian/bookworm64 |
| IP | 192.168.56.159 |
| Hostname | haniel.kaue |
| RAM | 1024 MB |# docker-vagrant-ansible
