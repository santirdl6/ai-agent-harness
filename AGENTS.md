# AGENTS.md - Mapa de navegacion para agentes de IA

Este archivo es el punto de entrada para cualquier agente que trabaje en este repositorio. No es una biblia de reglas: es un mapa de divulgacion progresiva.

## 1. Antes De Empezar

1. Ejecuta `./init.sh` y verifica que termina sin errores. Si falla, para y resuelve el entorno antes de tocar codigo.
2. Lee `progress/current.md` para entender el estado de la ultima sesion.
3. Lee `feature_list.json` y elige una sola tarea con estado `pending`.
4. Lee el contrato de rol en `subagents/` que corresponda a tu funcion.

## 2. Mapa Del Repositorio

| Archivo / carpeta | Que contiene | Cuando leerlo |
|-------------------|--------------|---------------|
| `feature_list.json` | Lista de tareas con estado (`pending`, `in_progress`, `done`, `blocked`) | Siempre, al empezar |
| `progress/current.md` | Estado de la sesion actual | Siempre, al empezar |
| `progress/history.md` | Bitacora append-only de sesiones anteriores | Si necesitas contexto historico |
| `docs/architecture.md` | Arquitectura esperada del proyecto real | Antes de implementar |
| `docs/conventions.md` | Reglas de estilo, nombres, estructura y limites | Antes de escribir codigo |
| `docs/verification.md` | Como demostrar que el trabajo funciona | Antes de declarar una tarea como `done` |
| `CHECKPOINTS.md` | Criterios objetivos de estado final correcto | Para revisar/cerrar |
| `subagents/` | Contratos de roles agnosticos de SDK | Si orquestas trabajo |

## 3. Reglas Duras

- Una sola feature a la vez. No mezcles cambios de varias tareas en la misma sesion.
- No declares una tarea `done` sin evidencia verde. Ejecuta `./init.sh` y el comando de verificacion definido en `docs/verification.md`.
- Documenta lo que haces en `progress/current.md` mientras trabajas, no al final.
- Cada subagente escribe su reporte en `progress/` y responde al orquestador solo con una referencia.
- No dependas de un SDK concreto. Traduce las instrucciones a capacidades disponibles: leer, escribir, buscar, ejecutar comandos o lanzar otro agente.

## 4. Como Elegir Una Tarea

```text
1. Abre feature_list.json
2. Filtra por status == "pending"
3. Toma la de menor id
4. Cambia su status a "in_progress"
5. Anota en progress/current.md: feature, hora de inicio, rol y plan breve
```

## 5. Cierre De Sesion

1. Ejecuta `./init.sh` y la verificacion del proyecto real.
2. Si la tarea esta acabada y revisada, marca `status: "done"` en `feature_list.json`.
3. Mueve el resumen de `progress/current.md` al final de `progress/history.md`.
4. Vacia `progress/current.md` dejando solo la plantilla.
5. No dejes archivos temporales, artefactos locales ni TODOs sin contexto.

## 6. Si Te Bloqueas

- Relee la seccion relevante de `docs/`.
- Documenta el bloqueo en `progress/current.md`.
- Cambia la feature a `blocked` si no puedes avanzar sin una decision humana.
