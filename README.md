# BB Browser

O warsaw exige a presença do systemd para executar.
Para isso é necessário chamar o `/sbin/init` no momento do boot do container.

## Podman vs Docker

Para executar o systemd em um container docker é necessário algumas adaptações:

https://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container/

Então usei o `podman`, conforme o próprio artigo da redhat sugere:

https://developers.redhat.com/blog/2019/04/24/how-to-run-systemd-in-a-container/

## Build e Execução

É necessário ter `podman` instalado antes de executar os passos abaixo.

### Podman

```bash
. /etc/os-release
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"
wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_${VERSION_ID}/Release.key -O- | sudo apt-key add -
sudo apt-get update -qq
sudo apt-get -qq -y install podman
```

O pacote .deb pode ser encontrado em https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_18.04/amd64/podman_1.8.0~7_amd64.deb


## Para construir o container

```bash
./build.sh
```

## Como executar o container

```bash
./exec.sh
```

Fazer login com o usuário `bank`

Chamar o browser:

```bash
# bb abre o navegador
bb
```
