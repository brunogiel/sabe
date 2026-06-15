# SecondBrain

Un método simple e instalable para ordenar cómo trabajás con **Claude Code** (o **Cowork**) y hacerlo crecer en el tiempo. Un archivo te deja arrancando. Un skill `/second-brain-coach` te va subiendo de nivel, de a un escalón.

Es para cualquiera: no hace falta que programes. Si programás, la división código/contexto ya viene contemplada.

---

## Por qué funciona

Claude es un cerebro que genera texto. El harness (Claude Code, Cowork) le da manos y memoria. **Tus carpetas son lo que lo convierte en _tu_ asistente.** Unos archivos de texto, que el asistente lee al arrancar cada sesión, lo hacen dejar de adivinar quién sos y cómo trabajás. Ese es todo el truco. El resto es ordenar.

Casi nadie escribe esos archivos. Esto te da la semilla y te lleva de la mano para hacerla crecer.

## Instalación

```bash
curl -fsSL https://raw.githubusercontent.com/brunogiel/secondbrain-claude/main/install.sh | bash
```

Te crea las carpetas PARA y los archivos base en la carpeta actual, y deja los skills instalados.

¿No estás en la terminal (ej. Cowork desktop)? Bajá el zip o hacé `git clone`, o abrí Claude en la carpeta y decile *"armame el sistema"*.

Después abrí Claude Code o Cowork en la carpeta y escribí **`/second-brain-coach`**.

## La escalera (crecé de a poco)

No armás todo el día uno. Subís de a un escalón.

| Nivel | Qué sumás |
|---|---|
| **0** | Te conoce (`sobre-mi` + `como-trabajo`) |
| **1** | Tu primer proyecto |
| **2** | Atajos |
| **3** | Tu primer skill (la regla de 3) |
| **4** | (si programás) split código/contexto |

¿No sabés en qué escalón estás o qué sigue? Pedile **`/second-brain-coach`**. Te ubica y te propone el próximo paso. Propone, vos decidís.

## Qué trae adentro

- **`CLAUDE.md`** — tu archivo raíz, lo primero que se lee en cada sesión. Funciona el día uno y trae la escalera adentro.
- **`sobre-mi.md` / `como-trabajo.md`** — quién sos y cómo te gusta trabajar (templates para llenar).
- **`reference.md`** — el manual que crece: PARA, la regla de 3, pasos mecánicos vs de criterio (DET/LAT), convenciones.
- **`MEMORIA.md`** — hechos que tu asistente acumula con el tiempo.
- **Skills** (dormidos hasta que una frase los despierta):
  - **`second-brain-coach`** — te sube de nivel.
  - **`redactar`** — escribe en tu voz (la aprende de textos tuyos).
  - **`anti-slop`** — le saca el olor a IA a cualquier texto.

## Filosofía

- **Propone, vos decidís.** Nada se crea sin tu OK.
- **Un escalón por vez.** Sin listas que abruman.
- **Todo viaja dormido.** Un skill no hace nada hasta que una frase lo despierta, así podés tener muchos sin ruido.

## Autor

Hecho por [Bruno Gielczynsky](https://www.linkedin.com/in/brunogiel/). Parte de una familia de métodos de AI instalables junto con [Empat.ia](https://github.com/brunogiel/Empat.ia).

## Licencia

MIT. Usalo, forkealo, hacelo tuyo.
