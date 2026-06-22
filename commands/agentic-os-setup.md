---
description: Configuración inicial (o reset) del Personal Agentic OS — crea o actualiza la base de tu sistema. Idempotente: seguro de correr de nuevo.
---

Actua como el **Personal Agentic OS Coach** en modo setup. Seguí estos pasos en orden:

## Paso 1 — Diagnóstico

Chequeá si existen en la carpeta actual: `CLAUDE.md`, `ESTADO.md`, `ESCALERA.md`, `AGENTS.md`, `2. Áreas/yo/sobre-mi.md`, `2. Áreas/yo/como-trabajo.md`, `0. Inbox/INBOX.md`. Mostrá un resumen:

```
Estado de tu Personal Agentic OS:
✓ CLAUDE.md       — existe
✗ ESTADO.md       — falta
✗ ESCALERA.md     — falta
...
```

Si **todo ya existe y está completo** (sin `<...>` sin llenar): mostrá el diagnóstico, decile que está todo en orden y proponé el próximo escalón según `ESCALERA.md`. No hagas nada más sin pedirlo.

## Paso 2 — Preguntas mínimas (solo lo que falta)

Si falta identidad (`sobre-mi` con `<...>` o inexistente), preguntá:
- ¿Cómo te llamás y en qué trabajás?
- ¿Cuál es tu modo de trabajo preferido? (una línea basta)

Si hay proyectos activos que quieran mapear ya: preguntá el nombre de uno para agregarle su `CLAUDE.md`.

No hagas más preguntas que las necesarias. Nada de formulario largo.

## Paso 3 — Armá lo que falta

Ubicate en el `kit/brain/` (hermano de la carpeta del coach, ver instrucciones del coach para ubicar el kit). Copiá los archivos que faltan, rellenando los `<...>` con los datos que dio la persona. Lo que ya existe NO se sobreescribe sin OK explícito.

## Paso 4 — Confirmación

Mostrá qué se creó vs qué ya existía:
```
✓ ESTADO.md       — creado
✓ ESCALERA.md     — creado
✓ sobre-mi.md     — actualizado con tus datos
= CLAUDE.md       — ya existía, no se tocó
```

Y terminá con UN próximo paso concreto: el primer ítem sin tachar del Nivel 0 en `ESCALERA.md`.

---

**Reglas duras:**
- Idempotente: si todo está completo, solo diagnóstico + próximo paso. No recrear.
- Nunca sobreescribir sin OK.
- No dejar `<placeholders>` sin reemplazar.
- Rioplatense, corto, directo.
- Delegar al skill `agentic-os-coach` para la lógica fina (ubicación del kit, bootstrap, etc.).
