# Verificacion

Regla de oro: el agente no dice "funciona", lo demuestra con evidencia ejecutable.

## Completar Al Adoptar El Arnes

Reemplaza los comandos de ejemplo por los comandos reales del proyecto.

## Verificacion Del Arnes

```bash
./init.sh
```

## Verificacion Del Proyecto

Define aqui los comandos reales. Ejemplos comunes:

```bash
npm test
```

```bash
pytest
```

```bash
cargo test
```

```bash
go test ./...
```

## Evidencia Requerida

El implementador debe dejar en `progress/impl_<feature>.md`:

- Comandos ejecutados.
- Resultado resumido.
- Fallos encontrados y como se resolvieron.
- Si no pudo ejecutar una verificacion, motivo exacto y riesgo residual.

## Anti-Patrones

- "Deberia funcionar" sin comando ejecutado.
- Marcar `done` con tests rojos.
- Reemplazar tests por inspeccion visual cuando hay una prueba automatica disponible.
- Ocultar fallos de verificacion en el reporte.
