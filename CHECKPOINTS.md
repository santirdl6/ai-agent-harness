# CHECKPOINTS - Evaluacion del estado final

En sistemas multi-agente no se evalua el camino, se evalua el destino. Estos checkpoints ayudan a un juez humano o IA a decidir si la sesion esta sana.

## C1 - El Arnes Esta Completo

- [ ] Existen `AGENTS.md`, `init.sh`, `feature_list.json` y `progress/current.md`.
- [ ] Existen `docs/architecture.md`, `docs/conventions.md` y `docs/verification.md`.
- [ ] Existen `subagents/leader.md`, `subagents/explorer.md`, `subagents/designer.md`, `subagents/implementer.md` y `subagents/reviewer.md`.
- [ ] `./init.sh` termina con exit code 0.

## C2 - El Estado Es Coherente

- [ ] Como mucho una feature esta en `in_progress`.
- [ ] Toda feature `done` tiene evidencia de verificacion en `progress/` o en el historial.
- [ ] `progress/current.md` esta vacio o describe la sesion activa.

## C3 - El Trabajo Respeta La Arquitectura

- [ ] Los archivos modificados estan dentro del alcance de la feature activa.
- [ ] Si la feature requeria diseno previo, existe `progress/design_<feature>.md` y ADR cuando aplica.
- [ ] Las dependencias nuevas estan justificadas.
- [ ] No hay artefactos temporales, logs de debug ni TODOs sin contexto.

## C4 - La Verificacion Es Real

- [ ] El comando principal de `docs/verification.md` fue ejecutado o se documento por que no pudo ejecutarse.
- [ ] El output relevante quedo documentado en `progress/impl_<feature>.md`.
- [ ] Si no hay tests automaticos, hay smoke test reproducible.

## C5 - La Sesion Se Cerro Bien

- [ ] `progress/review_<feature>.md` existe y contiene veredicto.
- [ ] `progress/history.md` tiene una entrada para la sesion cerrada.
- [ ] La feature trabajada refleja su estado final correcto.

El rol `reviewer` recorre cada punto, marca `[x]` o `[ ]`, y rechaza el cierre si quedan controles incumplidos.
