# Subagentes

Estos contratos son agnosticos de SDK. Puedes usarlos como prompts de sistema, instrucciones de herramientas, nodos de grafo o sesiones separadas.

| Rol | Archivo | Responsabilidad | Escribe codigo |
|-----|---------|-----------------|----------------|
| `leader` | `leader.md` | Orquestar, elegir feature, lanzar roles y cerrar sesion. | No |
| `explorer` | `explorer.md` | Investigar preguntas acotadas y dejar hallazgos. | No |
| `designer` | `designer.md` | Disenar modulos, patrones o decisiones tecnicas antes de implementar. | No |
| `implementer` | `implementer.md` | Implementar una feature y verificarla. | Si |
| `reviewer` | `reviewer.md` | Revisar, ejecutar checks y aprobar/rechazar. | No |

## Capacidades Minimas Por SDK

- Lectura de archivos para todos los roles.
- Escritura de archivos para `leader`, `explorer`, `designer`, `implementer` y `reviewer` en `progress/`.
- Escritura de documentacion de arquitectura para `designer` cuando el diseno o ADR deba persistir.
- Escritura de codigo solo para `implementer`.
- Ejecucion de comandos para `leader`, `implementer` y `reviewer`.
- Delegacion o sesiones separadas para simular subagentes si el SDK no tiene soporte nativo.

## Regla De Comunicacion

Los subagentes no deben devolver reportes largos por chat. Deben escribirlos en `progress/` y responder con una referencia corta.
