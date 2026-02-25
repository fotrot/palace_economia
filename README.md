# 🏦 Palace Economía V4
## Sistema Macroeconómico Nacional para Qbox

---

## 📌 Descripción

**Palace Economía V4** es un sistema macroeconómico institucional diseñado para servidores FiveM que utilizan **Qbox (qbx_core)**.

Simula una economía nacional completa dentro del roleplay, permitiendo que el Banco Central tome decisiones reales que impactan en todos los jugadores del servidor.

No es un script de impuestos.  
Es un **modelo macroeconómico persistente y dinámico**.

---

## 🎯 Objetivo

Crear un sistema económico donde:

- La emisión monetaria tenga consecuencias
- La inflación afecte precios reales
- La deuda pública impacte el riesgo país
- Las decisiones políticas generen estabilidad o crisis
- Exista historial macroeconómico persistente
- El Banco Central sea una institución funcional IC

---

## 🧩 Compatibilidad

- ✔ Qbox (`qbx_core`)
- ✔ ox_lib
- ✔ oxmysql
- ✔ Lua 5.4
- ✔ fx_version `cerulean`

---

## 📂 Estructura del Recurso

```
palace_economia/
│
├─ fxmanifest.lua
├─ config.lua
│
├─ shared/
│   └─ utils.lua
│
├─ client/
│   ├─ notificaciones.lua
│   ├─ bc_menu.lua
│   ├─ bc_dashboard.lua
│   ├─ bc_monetaria.lua
│   ├─ bc_fiscal.lua
│   ├─ bc_deuda.lua
│   ├─ bc_metricas.lua
│   └─ bc_reportes.lua
│
├─ server/
│   ├─ main.lua
│   ├─ masa.lua
│   ├─ inflacion.lua
│   ├─ impuestos.lua
│   ├─ precios.lua
│   ├─ presupuesto.lua
│   ├─ deuda.lua
│   ├─ riesgo.lua
│   ├─ bonos.lua
│   ├─ webhook.lua
│   ├─ bc_logs.lua
│   ├─ bc_metricas.lua
│   ├─ bc_gestion.lua
│   └─ comandos.lua
│
└─ SQL/
    ├─ economia_items.sql
    ├─ economia_bonos.sql
    ├─ economia_logs.sql
    ├─ economia_metricas.sql
    ├─ economia_empleados.sql
    └─ economia_alertas.sql
```

---

# 🏦 Funcionalidades

## 💰 Masa Monetaria
- Emisión y reducción de dinero
- Impacta directamente en inflación
- Control institucional

## 📈 Inflación Dinámica
- Se calcula automáticamente
- Depende de masa monetaria y confianza
- Afecta precios reales

## 🧾 Impuestos Automáticos
- Cobro periódico a jugadores conectados
- Incrementa presupuesto estatal

## 🏛 Presupuesto Estatal
- Registro de ingresos y gastos
- Control financiero institucional

## 💳 Deuda Pública
- Emisión de deuda
- Intereses dinámicos
- Riesgo de default

## 🌍 Riesgo País
- Calculado según inflación y deuda
- Impacta en tasas de interés

## 📊 Métricas Históricas
- Snapshot automático cada 30 minutos
- Persistencia en base de datos

## 🏦 Bonos Públicos
- Sistema de bonos comprables
- Registro de interés y vencimiento

## 🛒 Precios Dinámicos
- Ajustados por inflación
- Guardados en base de datos

## 👔 Gestión Institucional
- Sistema por job `bcentral`
- Control por rangos
- Registro de decisiones

---

# ⚙ Configuración

Todo el sistema es configurable desde:

```
config.lua
```

Se puede modificar:

- Intervalos de actualización
- Límites macroeconómicos
- Intereses
- Impacto inflacionario
- Riesgo país
- Bonos
- Webhooks

---

# 🛠 Instalación

1. Colocar la carpeta `palace_economia` en `resources`
2. Importar todos los archivos SQL en tu base de datos
3. Verificar que estén activos:
   - `oxmysql`
   - `ox_lib`
   - `qbx_core`
4. Agregar al `server.cfg`:

```
ensure palace_economia
```

5. Reiniciar el servidor

---

# 🔐 Permisos

El sistema usa el job:

```
bcentral
```

Rangos configurables en `config.lua`.

Solo estos rangos pueden:

- Emitir dinero
- Modificar deuda
- Tomar decisiones macro

---

# 🔄 Funcionamiento Automático

Sin intervención humana:

- Se cobran impuestos cada hora
- Se actualiza inflación
- Se recalcula riesgo país
- Se ajustan precios
- Se guardan métricas

---

# 🚨 Posibles Crisis

El sistema puede generar:

- Hiperinflación
- Default técnico
- Crisis de confianza
- Riesgo país extremo
- Recesión económica

Todo depende de decisiones IC.

---

# 📊 Modelo Económico

Variables principales:

- Masa Monetaria
- Inflación
- Deuda Pública
- Presupuesto
- Confianza Económica
- Riesgo País

Todas interconectadas.

---

# 🧠 Nivel del Sistema

Este recurso es un:

> Simulador macroeconómico institucional persistente para roleplay político y financiero.

No es un script básico.
Está diseñado para servidores avanzados.

---

# 📦 Versión

```
Version: 4.0.0
Framework: Qbox
Autor: Palace Development
```

---

# 🚀 Futuras Expansiones

- PIB y crecimiento económico
- Bolsa de valores
- Sistema bancario con préstamos
- Indicadores gráficos NUI
- Integración con empresas del servidor

---

# 📄 Licencia

Uso exclusivo del servidor propietario.
No redistribuir sin autorización.

---

# 🏁 Final

Palace Economía V4 convierte la economía del servidor en un sistema vivo,
institucional y estratégico.

El Banco Central deja de ser decorativo.
La economía pasa a ser real.
