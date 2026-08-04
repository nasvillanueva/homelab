set dotenv-load := true
set export := true

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

vaultwarden *args:
  just compose vaultwarden {{args}}

sumika *args:
  just compose sumika {{args}}

restic *args:
  ./scripts/restic {{args}}

backup:
  just restic backup

backup-check:
  just restic check

backup-ls-latest:
  just restic ls latest

backup-restore-all target="/tmp/restic-restore":
  just restic restore latest --target "{{target}}"

backup-restore-service service target="/tmp/restic-restore":
  just restic restore latest \
    --include "$HOMELAB_CONFIG_DIR/{{service}}" \
    --target "{{target}}"

restore *args:
  ./scripts/restore {{args}}

restore-service service target="/tmp/restic-restore":
  just restore "{{service}}" "{{target}}"

restore-service-dryrun service target="/tmp/restic-restore":
  just restore --dry-run "{{service}}" "{{target}}"
