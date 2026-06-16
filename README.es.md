# SecondBrain

Un método simple e instalable para ordenar cómo trabajás con **Claude Code** (o **Cowork**) y hacerlo crecer en el tiempo. Instalás una sola cosa, un coach, y él arma y hace crecer el resto con vos, de a un escalón.

Es para cualquiera: desde el que arranca de cero hasta el que ya la tiene clara. No hace falta que programes. Si programás, la división código/contexto ya viene contemplada.

---

## Por qué funciona

Claude es un cerebro que genera texto. El harness (Claude Code, Cowork) le da manos y memoria. **Tus carpetas son lo que lo convierte en _tu_ asistente.** Unos archivos de texto, que el asistente lee al arrancar cada sesión, lo hacen dejar de adivinar quién sos y cómo trabajás. Ese es todo el truco. El resto es ordenar.

Casi nadie escribe esos archivos. Esto te da la semilla y un coach que te lleva de la mano para hacerla crecer.

## Instalación

```bash
curl -fsSL https://raw.githubusercontent.com/brunogiel/secondbrain-claude/main/install.sh | bash
```

Te crea las carpetas PARA, lo esencial (tu router `CLAUDE.md` y el `ESTADO.md` en la raíz, tus básicos de identidad en `2. Áreas/yo/`), una carpeta oculta `.secondbrain/` para la maquinaria, e instala los skills del kit globales (el motor, para que el coach funcione en todos lados). Los skills que armás después viven en tu carpeta y viajan con ella. El resto crece a medida que subís. Tu carpeta queda limpia: ves solo lo tuyo.

¿No estás en la terminal (ej. Cowork desktop)? Bajá el zip o hacé `git clone`, o abrí Claude en la carpeta y decile *"armame el sistema"*.

Después abrí Claude Code o Cowork en la carpeta y escribí **`/second-brain-coach`**.

## La escalera (crecé de a un escalón)

No armás todo el día uno. Subís. El coach te enseña la idea de cada escalón, no solo qué hacer.

| Nivel | Qué aprendés + sumás |
|---|---|
| **0** | Las 3 capas (modelo / harness / tus carpetas). Te conoce (`sobre-mi` + `como-trabajo`) |
| **1** | Tu primer proyecto (su propio cerebro + log de decisiones) |
| **2** | Atajos (rutean al asistente al toque) |
| **3** | Tu primer skill, y qué es un script: el chequeador de updates del kit |
| **4** | Tu primera rutina (algo que corre solo) |
| **5** | (si programás) el split código/contexto |

¿En bolas o avanzado? El coach se adapta: de a un escalón con todo explicado si arrancás, o un setup rápido de varios escalones más un track avanzado si ya la tenés clara. Pedile **`/second-brain-coach`** cuando quieras: te ubica y te propone el próximo paso. Propone, vos decidís.

## Cowork, Code o lo que sea (agnóstico al modelo y al harness)

Tu sistema entero son archivos de texto en una carpeta sincronizada, así que es el mismo cerebro abras donde abras. Arrancá en **Cowork** (sin terminal); crecé a **Claude Code** abriendo la misma carpeta, sin migración. Y no está atado a Claude: la misma carpeta sirve con **Codex, Cursor o lo que venga**. El harness es solo las manos; el cerebro es tuyo y portable, agnóstico al modelo y a la herramienta.

## Qué trae adentro

- **`CLAUDE.md`**: tu archivo raíz, un router fino que se lee al arrancar cada sesión.
- **`ESTADO.md`**: tu tablero (dónde estás, qué hay activo).
- **`sobre-mi.md` / `como-trabajo.md`**: quién sos y cómo te gusta trabajar (templates para llenar).
- **`soul.md` / `dev-prefs.md`**: lo de fondo (se llena con el tiempo, hablando) y, si programás, cómo te gusta laburar el código.
- **`.secondbrain/`** (oculto): el proceso, o sea `reference.md` (el manual) y el control de versión. Fuera de vista, sincroniza igual.
- **Skills** (dormidos hasta que una frase los despierta):
  - **`second-brain-coach`**: te sube de nivel y te enseña mientras subís.
  - **`redactar`**: escribe en tu voz (la aprende de textos tuyos).
  - **`anti-slop`**: le saca el olor a IA a cualquier texto.
  - **`crear-skill`**: te ayuda a armar un skill nuevo bien hecho.
  - **`auditar-sistema`**: una revisión de salud de tu sistema (va bien como rutina).
  - **`triage-mails`**: un digest del inbox a la mañana (necesita Gmail por MCP).
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
