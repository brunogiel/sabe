# SecondBrain

**Claude arranca cada sesión adivinando quién sos.** Esto corta la adivinanza: unos archivos de texto que lee al arrancar lo convierten en _tu_ asistente, no en uno genérico. No es un segundo cerebro para que leas vos: es un segundo cerebro desde el que opera tu asistente.

Un método simple e instalable para ordenar cómo trabajás con **Claude Code** (o **Cowork**) y hacerlo crecer en el tiempo. Instalás una sola cosa, un coach, y él arma y hace crecer el resto con vos, de a un escalón.

Es para cualquiera: desde el que arranca de cero hasta el que ya la tiene clara. No hace falta que programes. Si programás, la división código/contexto ya viene contemplada.

---

## Por qué funciona

Claude es un cerebro que genera texto. El harness (Claude Code, Cowork) le da manos y memoria. **Tus carpetas son lo que lo convierte en _tu_ asistente.** Unos archivos de texto, que el asistente lee al arrancar cada sesión, lo hacen dejar de adivinar quién sos y cómo trabajás. Ese es todo el truco. El resto es ordenar.

Casi nadie escribe esos archivos. Esto te da la semilla y un coach que te lleva de la mano para hacerla crecer. Lo vas a notar en la **segunda sesión**: vuelve sabiendo lo que le contaste en la primera.

## Instalación

```bash
curl -fsSL https://raw.githubusercontent.com/brunogiel/secondbrain-claude/main/install.sh | bash
```

Te crea las carpetas `0. Inbox/` + PARA, lo esencial (tu router `CLAUDE.md`, el `ESTADO.md` y un puntero `AGENTS.md` en la raíz, tus básicos de identidad en `2. Áreas/yo/`), una carpeta oculta `.secondbrain/` para la maquinaria, e instala los skills del kit globales (el motor, para que el coach funcione en todos lados). Los skills que armás después viven en `.claude/skills/` (que es donde tu asistente los descubre y los dispara), con un atajo visible `skills/` para que los veas y los edites. El resto crece a medida que subís. Tu carpeta queda limpia: ves solo lo tuyo.

¿No estás en la terminal (ej. Cowork desktop)? Bajá el zip o hacé `git clone` y abrí la carpeta en Claude: el coach viene adentro, en el `.claude/skills/` de la carpeta, así que está disponible al toque. Decile *"armame el sistema"*.

Después abrí Claude Code o Cowork en la carpeta y escribí **`/second-brain-coach`**.

## La escalera (crecé de a un escalón)

No armás todo el día uno. Subís. El coach te enseña la idea de cada escalón, no solo qué hacer.

| Nivel | Qué aprendés + sumás | Qué ganás |
|---|---|---|
| **0** | Las 3 capas (modelo / harness / tus carpetas) + capturar: te conoce (`sobre-mi` + `como-trabajo`) y nada se pierde (`0. Inbox/`) | Deja de adivinar quién sos |
| **1** | Tu primer proyecto (su propio cerebro + log de decisiones) | No volvés a explicar un proyecto dos veces |
| **2** | Atajos (rutean al asistente al toque) | Decís "mis gastos" y ya sabe dónde mirar |
| **3** | Tu primer skill (leés el `actualizar` que viene, después armás el tuyo) y qué es un script | Una frase dispara una receta entera |
| **4** | Tu primera rutina (algo que corre solo, con log de corrida) | El sistema trabaja mientras dormís |
| **5** | (si programás) el split código/contexto | Código en su repo, contexto acá, sin mezclar |

¿En bolas o avanzado? El coach se adapta: de a un escalón con todo explicado si arrancás, o un setup rápido de varios escalones más un track avanzado si ya la tenés clara. Pedile **`/second-brain-coach`** cuando quieras: te ubica y te propone el próximo paso. Propone, vos decidís.

## Cowork, Code o lo que sea

Tu **cerebro** son archivos de texto en una carpeta sincronizada, así que es el mismo abras donde abras. Arrancá en **Cowork** (sin terminal); crecé a **Claude Code** abriendo la misma carpeta, sin migración. Y el texto no está atado a Claude: tus carpetas, identidad y proyectos sirven con **Codex, Cursor o lo que venga** (un `AGENTS.md` que viene incluido apunta a los agentes no-Claude a tu `CLAUDE.md`).

Siendo honestos con la línea: el **cerebro** (tu texto) es del todo portable; el **motor** (los skills de `.claude/skills/` y los `/comandos`) está pensado para Claude Code / Cowork. En otro harness viaja el texto, no los disparadores. El harness es las manos; el cerebro es tuyo.

> **Y si desarrollás software en serio** (con epics, PRDs, equipo), eso es otro deporte. Combiná SecondBrain con un método de desarrollo como [BMAD-METHOD](https://github.com/bmad-code-org/BMAD-METHOD): SecondBrain se queda con tu contexto y tus decisiones, el método de dev maneja la construcción. Conviven en el split código/contexto (Nivel 5).

## Qué trae adentro

- **`CLAUDE.md`**: tu archivo raíz, un router fino que se lee al arrancar cada sesión.
- **`ESTADO.md`**: tu tablero (dónde estás, qué hay activo).
- **`AGENTS.md`**: un puntero de 6 líneas para que un agente no-Claude (Codex, etc.) encuentre tu `CLAUDE.md`.
- **`0. Inbox/`**: capturá sin decidir: tirá lo turbio acá y cocinalo después (el protocolo está en `INBOX.md`).
- **`sobre-mi.md` / `como-trabajo.md` / `mi-estilo.md`**: quién sos, cómo te gusta trabajar y una muestra de tu voz para escribir (templates para llenar, en `2. Áreas/yo/`).
- **`soul.md` / `dev-prefs.md`**: lo de fondo (se llena con el tiempo, hablando) y, si programás, cómo te gusta laburar el código. Los suma el coach a medida que subís; no vienen en la instalación.
- **`3. Recursos/arquitectura-skills.md`**: tu referencia para armar buenos skills (regla de 3, DET/LAT, anatomía, errores típicos).
- **`.secondbrain/`** (oculto): el proceso, o sea `reference.md` (el manual) y el control de versión. Fuera de vista, sincroniza igual.
- **Skills** (dormidos hasta que una frase los despierta):
  - **`second-brain-coach`**: te sube de nivel y te enseña mientras subís.
  - **`actualizar`**: chequea si el kit tiene versión nueva y, con tu OK, la instala (viene funcionando).
  - **`redactar`**: escribe en tu voz (la aprende de textos tuyos).
  - **`anti-slop`**: le saca el olor a IA a cualquier texto.
  - **`crear-skill`**: te ayuda a armar un skill nuevo bien hecho.
  - **`auditar-sistema`**: una revisión de salud de tu sistema (va bien como rutina).
  - **`triage`**: tu brief de la mañana y los accionables, cruzando tus fuentes: mail, calendario (reporte de citas) y tu chat/tareas de trabajo (Slack, Jira, Linear, Trello, Notion comments, lo que uses). Cada fuente necesita su MCP; con el mail solo ya arranca.
  - **`migrar-de-claude-projects`**: trae tus Projects cerrados de Claude al sistema.

## Filosofía

- **Propone, vos decidís.** Nada se crea sin tu OK.
- **Un escalón por vez.** Sin listas que abruman.
- **Enseña mientras subís.** Aprendés la idea, no solo la tarea.
- **Liviano para correr.** Lee solo lo que necesita, así no te quema el plan de $20.
- **Todo viaja dormido.** Un skill no hace nada hasta que una frase lo despierta.

## Autor

Hecho por [Bruno Gielczynsky](https://www.linkedin.com/in/brunogiel/). Parte de una familia de métodos de AI instalables junto con [Empat.ia](https://github.com/brunogiel/Empat.ia).

## Licencia

MIT. Usalo, forkealo, hacelo tuyo.
