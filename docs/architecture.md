# Arquitectura

Este documento define que significa hacer buen trabajo en el proyecto real. Los agentes deben evaluarse contra este archivo, no contra preferencias no documentadas.

## Completar Al Adoptar El Arnes

Reemplaza esta plantilla con informacion concreta del proyecto:

- Modulos, paquetes o servicios principales.
- Flujo de datos y dependencias permitidas.
- Limites entre capas.
- Lugares donde si y no se debe escribir codigo.
- Decisiones arquitectonicas importantes.

## Principios Por Defecto

- Mantener cambios pequenos y enfocados en una feature.
- Preferir la estructura existente antes de crear nuevas capas o abstracciones.
- No introducir dependencias externas sin justificarlo en `feature_list.json` o en este documento.
- Separar logica de dominio, IO, integraciones y UI cuando el proyecto ya tenga esas fronteras.
- No cambiar comportamiento existente sin test, evidencia o criterio de aceptacion explicito.

## Flujo De Datos

Describe aqui el flujo principal del proyecto.

```text
Actor externo
  -> Interfaz de entrada
  -> Capa de aplicacion
  -> Dominio
  -> Infraestructura
  -> Persistencia o integraciones externas
  -> Respuesta, evento o notificacion
```

## Reglas De Dependencia

- Los modulos de dominio no deben importar directamente servicios externos.
- Los modulos de dominio pueden usar abstracciones nombradas por capacidad, como `PaymentProvider`, `StorageProvider` o `NotificationPort`.
- Las implementaciones concretas viven en infraestructura o en el modulo propietario, pero separadas de la logica de dominio.
- Los adaptadores de entrada llaman a servicios de aplicacion o dominio, nunca directamente a proveedores externos.
- Los paquetes compartidos no deben depender de apps o servicios concretos.
- Las dependencias deben fluir desde capas externas hacia abstracciones internas, no al reves.

Flujo de dependencias:

```text
Entrada -> Servicio de aplicacion/dominio -> Puerto o abstraccion -> Adaptador concreto
```

## Fuera De Alcance

- Refactors amplios no pedidos por la feature activa.
- Limpiezas cosmeticas que mezclen ruido con cambios funcionales.
- Cambios de configuracion global sin necesidad concreta.
