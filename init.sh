#!/usr/bin/env bash
# init.sh - Verificacion minima del arnes.

set -u

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

ok() { printf "${GREEN}[OK]${NC}    %s\n" "$1"; }
warn() { printf "${YELLOW}[WARN]${NC}  %s\n" "$1"; }
fail() { printf "${RED}[FAIL]${NC}  %s\n" "$1"; }

EXIT_CODE=0

printf "%s\n" "-- 1. Verificando archivos base ----------------------"

for f in \
  AGENTS.md \
  CHECKPOINTS.md \
  feature_list.json \
  progress/current.md \
  progress/history.md \
  docs/architecture.md \
  docs/conventions.md \
  docs/verification.md \
  subagents/README.md \
  subagents/leader.md \
  subagents/explorer.md \
  subagents/designer.md \
  subagents/implementer.md \
  subagents/reviewer.md; do
  if [ ! -f "$f" ]; then
    fail "Falta archivo base: $f"
    EXIT_CODE=1
  else
    ok "Existe $f"
  fi
done

printf "\n%s\n" "-- 2. Validando feature_list.json ---------------------"

if command -v python3 >/dev/null 2>&1; then
  python3 - <<'PY'
import json
import sys

try:
    with open("feature_list.json", encoding="utf-8") as fh:
        data = json.load(fh)
    features = data.get("features")
    if not isinstance(features, list):
        raise ValueError("features debe ser una lista")
    valid = set(data.get("rules", {}).get("valid_status", [])) or {
        "pending",
        "in_progress",
        "done",
        "blocked",
    }
    in_progress = [f for f in features if f.get("status") == "in_progress"]
    if len(in_progress) > 1:
        raise ValueError(f"hay {len(in_progress)} features en in_progress; maximo 1")
    for feature in features:
        for key in ("id", "name", "title", "description", "acceptance", "status"):
            if key not in feature:
                raise ValueError(f"feature sin campo requerido: {key}")
        if feature["status"] not in valid:
            raise ValueError(f"estado invalido en feature {feature['id']}: {feature['status']}")
        if not isinstance(feature["acceptance"], list) or not feature["acceptance"]:
            raise ValueError(f"feature {feature['id']} necesita acceptance no vacio")
    print(f"[OK]    feature_list.json valido ({len(features)} features)")
except Exception as exc:
    print(f"[FAIL]  feature_list.json invalido: {exc}")
    sys.exit(1)
PY
  if [ $? -ne 0 ]; then EXIT_CODE=1; fi
else
  warn "python3 no esta disponible; no se pudo validar JSON"
fi

printf "\n%s\n" "-- 3. Verificacion del proyecto real ------------------"
warn "Configura los comandos reales en docs/verification.md"

printf "\n%s\n" "-- 4. Resumen -----------------------------------------"

if [ "$EXIT_CODE" -eq 0 ]; then
  ok "Arnes listo. Completa docs/ y feature_list.json para tu proyecto."
else
  fail "Arnes incompleto. Resuelve los errores antes de avanzar."
fi

exit "$EXIT_CODE"
