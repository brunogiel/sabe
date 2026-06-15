# SecondBrain

A simple, installable method to organize how you work with **Claude Code** (or **Cowork**) and grow it over time. One file gets you started. A `/second-brain-coach` skill walks you up, one level at a time.

Built for anyone: you don't need to code. If you do, the code/context split is already baked in.

> 🇦🇷 Method content is in Spanish (rioplatense). This README is in English for reach. Spanish version: [README.es.md](README.es.md).

---

## Why this works

Claude is a brain that generates text. The harness (Claude Code, Cowork) gives it hands and memory. **Your folders are what turn it into _your_ assistant.** A few plain text files, read at the start of every session, stop it from guessing who you are and how you work. That is the whole trick. The rest is staying organized.

Most people never write those files. This gives you the seed and walks you through growing it.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/brunogiel/secondbrain-claude/main/install.sh | bash
```

This creates your PARA folders and starter files in the current directory, and installs the skills globally.

Not on the terminal (e.g. Cowork desktop)? Download the zip or `git clone`, or just open Claude in the folder and say *"set up my system"*.

Then open Claude Code or Cowork in the folder and type **`/second-brain-coach`**.

## The ladder (grow one rung at a time)

You don't build the whole system on day one. You climb.

| Level | What you add |
|---|---|
| **0** | It knows you (`sobre-mi` + `como-trabajo`) |
| **1** | Your first project |
| **2** | Shortcuts |
| **3** | Your first skill (the rule of 3) |
| **4** | (if you code) code/context split |

Not sure where you are or what's next? Ask **`/second-brain-coach`**. It diagnoses your level and proposes the next step. It proposes, you decide.

## What's inside

- **`CLAUDE.md`** — your root file, read at the start of every session. Works on day one, and carries the growth ladder inside it.
- **`sobre-mi.md` / `como-trabajo.md`** — who you are and how you like to work (fill-in templates).
- **`reference.md`** — the manual that grows: PARA, the rule of 3, mechanical vs judgment steps (DET/LAT), conventions.
- **`MEMORIA.md`** — facts your assistant accumulates over time.
- **Skills** (dormant until a phrase triggers them):
  - **`second-brain-coach`** — walks you up the levels.
  - **`redactar`** — writes in your voice (learns it from your own sample texts).
  - **`anti-slop`** — strips the "AI smell" out of any text.

## Philosophy

- **Propose, you decide.** Nothing gets created without your OK.
- **One rung at a time.** No overwhelming to-do lists.
- **Everything ships dormant.** A skill does nothing until a phrase wakes it up, so you can carry many without noise.

## Credit

Made by [Bruno Gielczynsky](https://www.linkedin.com/in/brunogiel/). Part of a family of installable AI methods alongside [Empat.ia](https://github.com/brunogiel/Empat.ia).

## License

MIT. Use it, fork it, make it yours.
