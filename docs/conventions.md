# Convenciones

Este archivo fija reglas locales para que distintos agentes produzcan cambios consistentes.

## Completar Al Adoptar El Arnes

Documenta aqui:

- Lenguajes y versiones soportadas.
- Gestor de paquetes y comandos frecuentes.
- Formato, lint y estilo.
- Nombres de archivos, clases, funciones, tests y commits.
- Patrones de errores, logging y configuracion.

## Reglas Por Defecto

- Sigue el estilo que ya existe en el codigo cercano.
- No agregues helpers, capas o dependencias si una solucion directa resuelve la feature.
- Usa nombres explicitos antes que comentarios largos.
- Escribe comentarios solo para explicar decisiones no obvias.
- No dejes TODOs sin owner, motivo y siguiente accion.
- No mezcles cambios de formato masivo con cambios funcionales.

## Tests

- Cada cambio funcional debe tener test automatico cuando el proyecto tenga infraestructura de tests.
- Si no existe infraestructura de tests, documenta un smoke test reproducible en `progress/impl_<feature>.md`.
- Los tests deben comprobar resultados observables, no solo ausencia de excepciones.
