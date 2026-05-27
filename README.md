# AI Agent Harness

Arnes multi-agente generico y agnostico de SDK para coordinar agentes de IA en proyectos de software.

El objetivo es que cualquier repositorio pueda incorporar contexto operativo minimo para que un agente elija una tarea, investigue, disene cuando haga falta, implemente, verifique y deje trazabilidad.

El arnes no depende de Claude, OpenAI, LangGraph, CrewAI, AutoGen ni de un runtime concreto. Cada SDK puede mapear sus agentes a los roles descritos en `subagents/`.

## Piezas Base

| Pieza | Proposito |
|-------|-----------|
| `AGENTS.md` | Punto de entrada para cualquier agente. |
| `feature_list.json` | Cola de trabajo con estados claros. |
| `subagents/` | Prompts/contratos de cada rol de subagente. |
| `docs/` | Arquitectura, convenciones y verificacion del proyecto real. |
| `progress/` | Estado persistente y reportes entre agentes. |
| `CHECKPOINTS.md` | Criterios objetivos para cerrar una sesion. |
| `init.sh` | Validacion ejecutable del arnes y del proyecto. |

## Uso Rapido

1. Reemplaza los placeholders de `feature_list.json` por las features de tu proyecto.
2. Ajusta `docs/architecture.md`, `docs/conventions.md` y `docs/verification.md`.
3. Conecta tu SDK al rol que quieras usar: `leader`, `explorer`, `designer`, `implementer` o `reviewer`.
4. Ejecuta `./init.sh` antes de empezar y antes de cerrar una tarea.
5. Pide al agente lider: `implementa la siguiente feature pendiente`.

## Flujo Recomendado

```text
usuario -> leader -> explorer(s) opcional(es) -> designer opcional -> implementer -> reviewer -> cierre
```

El chat debe transportar instrucciones breves, no diffs largos ni estado critico. Cada subagente escribe su resultado en `progress/` y responde solo con una referencia del tipo `done -> progress/impl_<feature>.md`.

## Trazabilidad

| Archivo | Quien lo escribe | Que contiene |
|---------|------------------|--------------|
| `progress/current.md` | leader / implementer | Sesion activa, plan, decisiones y bloqueos. |
| `progress/explore_<tema>.md` | explorer | Hallazgos acotados de investigacion. |
| `progress/design_<feature>.md` | designer | Diseno previo, tradeoffs y ADR si aplica. |
| `progress/impl_<feature>.md` | implementer | Cambios realizados y evidencia de tests. |
| `progress/review_<feature>.md` | reviewer | Veredicto y checklist. |
| `progress/history.md` | leader | Bitacora append-only de sesiones cerradas. |

## Estructura

```text
.
├── AGENTS.md
├── CHECKPOINTS.md
├── feature_list.json
├── init.sh
├── docs/
│   ├── architecture.md
│   ├── conventions.md
│   └── verification.md
├── subagents/
│   ├── README.md
│   ├── leader.md
│   ├── explorer.md
│   ├── designer.md
│   ├── implementer.md
│   └── reviewer.md
└── progress/
    ├── current.md
    └── history.md
```

## Adaptacion A SDKs

Cada SDK solo necesita tres capacidades: leer archivos, escribir archivos y ejecutar comandos de verificacion. Si un SDK no soporta subagentes nativos, ejecuta los roles secuencialmente en sesiones separadas usando los documentos de `subagents/` como prompts de sistema.
