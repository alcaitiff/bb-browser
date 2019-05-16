# Warsaw Browser

As últimas versões do warsaw exige a presença do systemd para executar.
Para isso, foi necessário chamar o `/sbin/init` no momento do boot do container.

## Podman vs Docker

Fazer um container docker executar systemd exige algumas adaptações:

https://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container/

Então usei o `podman`, conforme o próprio artigo da redhat sugere:

https://developers.redhat.com/blog/2019/04/24/how-to-run-systemd-in-a-container/

# Build e Execução

É necessário ter `podman` instalado antes de executar os passos abaixo.

## Para construir o container
```
./build.sh
```

## Como executar o container
```
./exec.sh
```

Fazer login com o usuário `bank`

Configurar o ambiente:
```
// tentei executar esse comando automaticamente junto
// com o login mas o warsaw não funciona

/start.sh
```

Chamar o browser:
```
firefox
```




