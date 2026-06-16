<!--
  AGENTS.md — puntero para harnesses que NO son Claude (Codex, Cursor, etc.).
  No dupliques contenido acá: la fuente de verdad es CLAUDE.md. Esto solo existe
  para que un agente que busca "AGENTS.md" sepa adónde ir.
-->

# AGENTS.md

La fuente de verdad de este sistema es **`CLAUDE.md`** (en esta misma carpeta). Leelo entero: es el router.

- El cerebro (carpetas de texto, identidad, proyectos) **y los skills de uso** son portables. Los skills viven en `skills/` (carpeta a la vista) y se disparan por la **tabla "Mis skills" del `CLAUDE.md`**: leé esa tabla y, cuando el usuario diga una de esas frases, seguí el `skills/<nombre>/SKILL.md` correspondiente. Así andan igual acá que en Claude.
- Lo único atado a Claude es el motor de armado (el comando `/second-brain-coach` y un par de skills de mantenimiento). Para armar o hacer crecer el sistema desde acá, seguí el `CLAUDE.md` y la doctrina en `.secondbrain/reference.md` a mano.
