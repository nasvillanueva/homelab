set dotenv-load := true

bootstrap:
  @docker network inspect homelab_proxy >/dev/null 2>&1 || docker network create homelab_proxy

compose stack *args:
  docker compose -f {{stack}}/compose.yaml {{args}}

media *args:
  just compose media {{args}}
