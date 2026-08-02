set dotenv-load := true

bootstrap:
  @docker network inspect homelab_gateway >/dev/null 2>&1 || docker network create homelab_gateway

compose stack *args:
  docker compose -f {{stack}}/compose.yaml {{args}}

media *args:
  just compose media {{args}}

ingress *args:
  just compose ingress {{args}}

yuvomi *args:
  just compose yuvomi {{args}}
