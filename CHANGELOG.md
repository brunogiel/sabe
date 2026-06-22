# Changelog

## 2.15.0 (2026-06-22)
- **Rebrand: SecondBrain → Personal Agentic OS.** Se renombró el producto y todos sus identificadores. Repo `secondbrain-claude` → `personal-agentic-os`; plugin/marketplace `name` → `personal-agentic-os`; comandos `/second-brain-coach` → `/agentic-os-coach` y `/second-brain-setup` → `/agentic-os-setup`; skill folder `skills/second-brain-coach/` → `skills/agentic-os-coach/` (frontmatter `name: agentic-os-coach`). URLs y paths actualizados en `install.sh`, `uninstall.sh`, `motor-code/actualizar/`, READMEs, kit y plugin manifests. Se conservó `second-brain` como keyword (SEO) y "second brain coach" como alias natural del trigger. La historia previa del CHANGELOG NO se tocó.
- **Pitch copy:** READMEs (EN/ES) y descripciones de plugin/marketplace reescritos alrededor de "personal agentic OS" (el intro lidera con la categoría; "second brain" queda como contraste/capa). Fix de paso: paso de install duplicado en el README EN. Pendiente: decks del workshop y post de LinkedIn (piezas de difusión, fuera del repo).

## 2.14.0
- **Dos comandos nuevos: `/second-brain-setup` y `/escalera`.** Inspirados en el patrón de Piero Sierra (SecondBrain KB).
  - **`/second-brain-setup`** — entrada dedicada al setup inicial, separada del coach. Idempotente: puede correrse de nuevo para reconfigurar sin pisar lo existente. Muestra un diagnóstico claro (qué existe vs qué falta), pregunta lo mínimo indispensable y arma lo que falta con OK del usuario. Pensado para onboarding explícito o para el que quiere saber "qué tengo configurado".
  - **`/escalera`** — vista rápida del progreso (nivel, barra, logros, próximo paso) sin entrar al flujo completo del coach. Si el usuario dice que ya hizo algo, lo tacha en `ESCALERA.md` en el acto.
  - Disponibles en Cowork (plugin: `commands/`) y en Code (curl: `~/.claude/commands/`). `install.sh` ahora los copia automáticamente.
- Tocados: `commands/second-brain-setup.md` (nuevo), `commands/escalera.md` (nuevo), `install.sh`, `VERSION`, `CHANGELOG.md`.

## 2.13.4
- **El coach hace un check de arranque del entorno antes de dejar laburar (fix #1 del debrief del workshop 2026-06-20).** En la primera entrega en vivo el cuello de botella nunca fue el concepto: fue el setup. Ahora el coach corre un **pre-flight** al tope del flujo, en toda invocación (también para un SB ya armado), que **avisa y guía, no bloquea**:
  - **Check 1 — sync a la nube:** detecta por ruta absoluta si la carpeta del brain cae fuera de un root sincronizado (Drive / iCloud / Dropbox / OneDrive) — Desktop, Documents, Downloads, disco/partición local → 🚩 riesgo de perder todo. Avisa y ofrece moverla; si el usuario lo pospone, lo registra (`Sync: local (avisado)`) y no machaca de nuevo.
  - **Check 2 — carpeta apuntada y con acceso:** corta el "arrancar en bolas" (sin working directory / sin acceso a la carpeta). Guía distinto según el cliente (Cowork: New task + acceso a la carpeta; Code: confirma el `cwd`/pregunta dónde está el brain).
  - **Aclaración de UI de Cowork (cuando hay confusión):** New task ≠ la vieja sección "Proyectos"; y Habilidades (skills) vs Conectores (MCP).
- **`ESTADO.md` suma el campo `Sync:`** (plantilla del kit + ejemplo del coach) para registrar el estado de sincronización y evitar repetir el aviso. Output esperado y Señales del coach actualizados.
- Tocados: `skills/second-brain-coach/SKILL.md`, `kit/brain/ESTADO.md`, `VERSION`, `CHANGELOG.md`.

## 2.13.3
- **Dos skills de uso actualizados desde sus versiones en uso real (no se toca ni el motor ni el brain).**
  - **`ppt-builder`:** se portaron las mejoras del orquestador de comunicación en uso. Nuevo: **bloqueo duro entre etapas** (no scaffoldear la siguiente aunque sobre contexto; material futuro → `[PENDIENTE]`), **regla de salida de la Etapa 1** (no adelantar índice/copy/estructura), **Copy partido en 3 sub-pasos** (draft → voz vía `redactar` → limpieza vía `anti-slop`) más consolidar las imágenes pendientes, las **slides emergen del storyboard** de Historia, y la Etapa 2 (Historia) fusiona "por qué importa (el stake)" con el storyboard de bloques. Fix: el camino de **Gamma** ahora aclara que no importa `.md` ni texto (solo paste o `.docx`); antes sugería un `.md` que no se puede subir.
  - **`panel`:** se sumó la **bajada** (paso nuevo). Después del mapa de ángulos neutro, Panel baja una lectura accionable (propuesta + oportunidades + pasos sugeridos), marcada como sugerencia y no veredicto, y recién ahí devuelve la pelota. El guardrail de neutralidad ahora aplica explícitamente al MAPA y no a la bajada; el schema del log suma el campo `bajada`. Panel sigue sin decidir: sugiere y devuelve la pelota.
- Tocados: `kit/skills/ppt-builder/SKILL.md`, `kit/skills/panel/SKILL.md`, `VERSION`, `CHANGELOG.md`.

## 2.13.2
- **Menú del plugin = solo el coach (Cowork más limpio).** Antes el plugin mostraba 3 ítems (`second-brain-coach`, `actualizar`, `migrar-de-claude-projects`); para un usuario nuevo, los otros dos son ruido. Ahora el motor ACTIVO es **un solo skill, el coach**:
  - **`migrar` se metió adentro del coach:** dejó de ser un skill suelto y pasó a ser un doc del coach (`migracion.md`) que el coach sigue cuando traés tus Projects de Claude. El menú no lo muestra; el coach lo hace cuando se lo pedís.
  - **`actualizar` salió del plugin:** vive en `motor-code/` (fuera del `skills/` que escanea el plugin). Es Code-only (en Cowork el plugin se autoactualiza); el curl lo sigue instalando global para Code.
- Coach y `reference.md` ajustados: los ejemplos de "abrí un skill para ver su anatomía" (N3) y "agendá una rutina" (N4) ya no apuntan a `actualizar` (que en Cowork no existe), sino a `crear-skill` y `auditar-sistema`.
- Tocados: estructura (`skills/migrar-de-claude-projects/SKILL.md` → `skills/second-brain-coach/migracion.md`; `skills/actualizar` → `motor-code/actualizar`), `install.sh`, `second-brain-coach/SKILL.md` + `reference.md`, `uninstall.sh`, ambos READMEs, `marketplace.json`.

## 2.13.1
- **Consistencia Cowork ↔ Code: el coach arma tu brain en los dos, preguntando.** Antes el `install.sh` (curl) scaffoldeaba tu carpeta solo, sin preguntar, lo que chocaba con la regla "propone, vos decidís". Ahora el `install.sh` instala **solo el método** (motor + kit) y no toca tu carpeta; el brain lo arma el coach con tu OK, igual que en Cowork. Los dos caminos quedan idénticos: instalás el método → `/second-brain-coach` → el coach invita/pregunta por la carpeta y arma con vos, de a un escalón.
- **Fix de sync del marketplace:** el `source` pasó de `"."` a `"./"`. Un source relativo tiene que arrancar con `./`; con `"."` Cowork tiraba "Error al sincronizar el marketplace" al validar el manifiesto.
- Tocados: `install.sh` (saca el scaffolding del brain + ajusta el mensaje final; queda como "instalar el método" a secas), `second-brain-coach/SKILL.md` ("Cowork o Code" + Bootstrap: el coach arma en los dos, preguntando), ambos READMEs ("Qué toca"), `marketplace.json`.

## 2.13.0
- **Instalación como plugin para Cowork (sin terminal), sin perder el curl.** El repo pasa a ser también un **plugin/marketplace**: en Cowork se instala desde la UI de plugins (agregar `brunogiel/secondbrain-claude` + Install), sin `curl`, sin zip, sin git. El **`curl` sigue igual para Claude Code** (probado end-to-end con el layout nuevo). Resuelve la fricción real: el `install.sh` necesitaba una terminal que el de Cowork no tiene. Bonus: el plugin se actualiza solo.
- **Layout flat y a la vista (el repo ES el plugin, `source: "./"`).** Nada queda enterrado bajo un `plugins/secondbrain/...`: abrís el repo y ves todo. Reorganización en tres bloques claros, separando lo que antes estaba mezclado adentro del coach:
  - `skills/` → **el motor** (los 3 skills que se activan: `second-brain-coach` + sus piezas, `actualizar`, `migrar-de-claude-projects`).
  - `kit/brain/` → **los templates** del brain, espejo de PARA (`identidad/`, `recursos/`, `inbox/` + los archivos raíz).
  - `kit/skills/` → **el catálogo de skills de uso** (redactar, anti-slop, ...). Skills, no templates. Quedan dormidos: el plugin solo activa lo que está en `skills/` de la raíz, no recursea, así que el catálogo no se autoactiva.
  - Nuevos: `.claude-plugin/marketplace.json` (source "./") + `.claude-plugin/plugin.json` + un comando `/second-brain-coach`.
- **`anti-slop` deja de parecer duplicado.** Son dos cosas distintas y ahora en lugares distintos y rotulados: el **skill** `anti-slop` (en `kit/skills/anti-slop/`) y su **doctrina** `anti-slop-writing.md` (en `kit/brain/recursos/`, se instala como Recurso). Mismo patrón que `crear-skill` (skill) + `arquitectura-skills.md` (doctrina que lee).
- **El coach arma el brain solo en Cowork.** Como ahí no corre `install.sh`, el bootstrap (carpetas + archivos base) lo hace el coach copiando desde su `kit/brain/`, respetando lo que ya exista y **siempre con OK explícito** (invita a crear/elegir la carpeta, no la crea de prepo). En Code lo sigue haciendo el `install.sh`, que además bundlea el kit con el coach (`~/.claude/skills/second-brain-coach/kit/`) para que el coach lo use después.
- **Robustez (tras un panel de revisión):**
  - *Ubicación del kit resiliente:* el coach ubica su `kit/` probando en orden (`${CLAUDE_PLUGIN_ROOT}/kit/` en Cowork → relativo a su `SKILL.md` si la var no resuelve → `~/.claude/skills/.../kit/` en Code), así el bootstrap de Cowork no depende de una sola variable. La ubicación se define una vez (en «Dónde vive cada cosa») en lugar de repetir la ruta cruda en 3 lados.
  - *Reemplazo atómico del kit en `install.sh`:* copia el kit nuevo y recién después hace el swap, así nunca queda una ventana sin kit si algo falla a mitad. Aclarado que el kit es contenido del método (refrescarlo es correcto), no de tu brain.
  - *No forzar:* coach y comando refuerzan que no se crea carpeta ni archivo sin un "dale".
- **Migración (camino viejo "git clone + abrir la carpeta"):** ese atajo (el coach venía adentro de `.claude/skills/` del repo) se reemplaza por el plugin. Si lo usabas así, hacé `git pull` y o bien instalá el plugin (`/plugin install secondbrain@secondbrain-claude`) o corré `install.sh` una vez para reactivar el motor.
- **Coach + doctrina path-agnósticos.** Las referencias dejan de ser rutas fijas (`~/.claude/skills/...`, que solo aplican en Code) y pasan a ser relativas ("hermano de tu `SKILL.md`", "el `kit/` que viaja con el método"), así andan igual como plugin (Cowork) o global (Code). Mismo ajuste en `reference.md` y `migrar`. `actualizar` queda marcado como la vía de Code.
- **`install.sh` reescrito** para el layout nuevo (lee de `skills/` + `kit/`); su comportamiento para Code es idéntico (motor global + scaffolding + scripts). `uninstall.sh` no cambia (saca solo el motor global de Code; en Cowork se saca el plugin desde la UI).
- Tocados: estructura del repo (move con historia), `install.sh`, `second-brain-coach/SKILL.md` + `reference.md`, `actualizar/SKILL.md`, `migrar-de-claude-projects/SKILL.md`, ambos READMEs ("Instalación" en dos caminos + "Qué toca" + "Qué trae adentro"), `marketplace.json` + `plugin.json` + comando nuevos.

## 2.12.0
- **Catálogo "📦 Todo lo que trae el kit" dentro de la `ESCALERA.md`.** Un solo lugar donde el usuario ve **lo que ofrece SecondBrain y maneja** y chequea qué tiene: los **archivos base** (CLAUDE.md, ESTADO, identidad, INBOX, doctrinas…) y los **8 skills de uso**, cada uno con su checkbox, una línea de qué hace, su frase gatillo y el nivel donde aparece. El motor (coach + `actualizar` + `migrar`) NO se lista: es global e invisible, no lo gestiona el usuario. Resuelve un agujero real: como los skills de uso se suman de a poco, el usuario no tenía dónde ver el menú completo ni saber qué le faltaba. Va unificado en la escalera (no un archivo nuevo) para no sumar otro archivo a la carpeta.
- **El coach mantiene el catálogo.** Disparos nuevos: *"¿qué skills tengo?"*, *"¿qué skills hay?"*, *"¿qué trae el kit?"*, *"¿los tengo todos?"* → sincroniza las marcas con la realidad (mira `skills/` + la tabla "Mis skills"), lo muestra y ofrece sumar el que sirva. Cada vez que activa un skill de uso lo tacha también acá; el Paso 8 (dejar el estado al día) lo incluye.
- Tocados: `templates/ESCALERA.md` (sección de catálogo + puntero en la intro), `second-brain-coach/SKILL.md` (frontmatter + "Disparos del catálogo" + "Sumar un skill de uso" + Paso 8) y ambos READMEs (bullet de `ESCALERA.md`). `install.sh` no se toca: la `ESCALERA.md` ya se instala.

## 2.11.0
- **Modo "ya tengo un sistema" en el coach (adoptar sin migrar).** Antes el "adoptar" igual te atornillaba el esqueleto SB (PARA + `ESTADO`/`ESCALERA`) encima de tu carpeta. Ahora el caso (a) del coach se parte en dos: **(a1)** sistema suelto o a medias → ofrece ordenarlo hacia PARA (como antes); **(a2)** sistema propio y ordenado → **no migra nada**, lee tu estructura, te la mantiene y te propone 2-3 mejoras *en tu propia estructura*, opt-in, sin renombrar nada.
- **Nuevo principio en la doctrina del coach: "Dirección, no estructura obligatoria".** El valor del método son principios (router al arrancar / identidad / captura / contexto por proyecto / ruteo / proponer-no-hacer), no los nombres de carpeta de PARA. PARA es el empaque default para el que arranca de cero, no el requisito.
- **Lo único no-negociable: la estructura mapeada en el router.** Si ya hay un router (`CLAUDE.md`/`AGENTS.md`) que describe dónde vive cada cosa, ese es el contrato y se usa tal cual. Si no, el coach valida la estructura con la persona y la escribe en su `CLAUDE.md` con SUS nombres. El mapeo es obligatorio (las mejoras encima son opt-in): sin router que conozca la estructura, el asistente vuelve a adivinar. La checklist se tilda **por equivalente** (un archivo de identidad cuenta aunque no se llame `sobre-mi`).
- **`uninstall.sh` nuevo + sección de transparencia "Qué toca (y cómo deshacerlo)" en ambos READMEs.** Desinstalar saca SOLO el motor global (`~/.claude/skills/`: coach + `actualizar` + `migrar`); tu carpeta/brain no se toca. El instalador ya era no-destructivo (nunca pisa un archivo que ya tenés); ahora está documentado explícito, para el que audita su propio sistema. Confirmación segura tanto en pipe (`SB_YES=1`) como interactivo.
- **Garantía de update explícita en `actualizar`:** sección nueva "Tu carpeta no se toca (solo el motor global)". Actualizar refresca solo el motor global, nunca pisa un archivo de tu carpeta. Si editaste un doc que ya tenías (tu `CLAUDE.md`, `arquitectura-skills.md`, etc.), te quedás con el tuyo; la versión nueva de ese doc se trae aparte solo si la pedís.
- **Framing de bajo compromiso en el README** ("¿Ya tenés un sistema?"): no es destructivo y es reversible, así que la movida honesta es instalarlo, probarlo y quedarse con lo que sirve. Sin migrar ni decidir nada grande de entrada.
- Tocados: coach (`second-brain-coach/SKILL.md`: nueva sección de doctrina + caso (a) partido en a1/a2 + Paso 1 respeta el router como contrato), `actualizar/SKILL.md` (garantía de update), `uninstall.sh` (nuevo) y ambos READMEs (bloques "¿Ya tenés un sistema?" + "Qué toca / cómo deshacerlo"). `install.sh` no se toca: ya era no-destructivo.

## 2.10.1
- **`council` reemplazado por `panel`** (mejor encaje como ejemplo de orquestador multi-agente del N5). En vez de DECIDIR por vos (council sintetizaba un veredicto), `panel` trae 2-5 reviewers con lentes distintas sobre el MISMO artefacto (un PRD, mail, doc, copy, propuesta), te muestra los ángulos y dónde coinciden/se contradicen, y te devuelve la pelota: vos decidís qué cambiás. Trae catálogo de 9 lentes, dos modos (deliberado/directo) y guardrail de neutralidad (reporta coincidencias como cuenta cruda, sin lenguaje de recomendación). Swap en `install.sh`, coach (N5 + "cuándo ofrecer"), `reference.md`, `arquitectura-skills.md`, `ejemplos.md` y ambos READMEs. El catálogo de skills de uso sigue en 8.

## 2.10.0
- **Nuevo skill `council`** (orquestador multi-agente, basado en el LLM Council de Karpathy): corre una decisión por 5 asesores con lentes distintas, peer-review anónimo entre ellos y síntesis de un chairman. Es el **segundo ejemplo de orquestador del N5** (multi-agente, junto a `ppt-builder` que es el de estado), y de paso resuelve un ref colgado: `reference.md` y `arquitectura-skills.md` lo citaban pero no se enviaba. Catálogo de skills de uso → 8. Sumado al `install.sh`, al coach (N5 + "cuándo ofrecer") y a ambos READMEs.
- **`dev-prefs.md` deja de ser un stub vacío:** ahora viene con un bloque de **reglas universales de ingeniería de fábrica** (tamaño de archivo, nombres, imports, secretos, logs, comentarios, código muerto, testing, performance), agnósticas al stack, más el andamiaje para completar lo tuyo. Así el escalón "si programás" arranca con baterías, no con `<...>`.
- **Nuevo Recurso `3. Recursos/anti-slop-writing.md`:** la doctrina completa detrás del skill `anti-slop` (las 5 reglas con listas negras español+inglés, ejemplos antes/después, guía anti-overfitting y quick check). Hasta ahora el skill `anti-slop` venía en el kit pero su doctrina de fondo no viajaba; ahora se instala como Recurso (igual que `arquitectura-skills.md`) y el skill la lee si está. Sumado al `install.sh` y a ambos READMEs.
- **Fixes de consistencia** (la lista de skills de uso quedó stale en varios lados tras sumar `ppt-builder` en 2.9.1 y ahora `council`): ahora figuran los **8** en los dos READMEs, en `reference.md` y en `ejemplos.md`.
- **Fix:** ambos READMEs decían escalera "0→5"; la real es **0→6** desde 2.9.0.
- **Fix:** el skill `anti-slop` titulaba "Las 4 reglas" y listaba 5 → "Las 5 reglas".
- **Higiene:** sacadas menciones al autor por nombre en notas de dev del propio CHANGELOG.

## 2.9.1
- **Nuevo skill `ppt-builder`** (versión despersonalizada de un orquestador de comunicación de un SB en uso real): arma una pieza de comunicación —deck/ppt por default, también post/video/carrusel/landing— en 5 etapas (Brief → Historia → Estructura → Copy → Asset), una a la vez con tu OK. Es el **orquestador de ejemplo del Nivel 5**: no hace todo solo, coordina e invoca `redactar` + `anti-slop` (copy) y el skill de pptx (asset). Cierra el TODO que dejaba el N5 sin ejemplo concreto. Catálogo de skills de uso → 7. Sumado al `install.sh`, al coach (N5) y a los READMEs.

## 2.9.0
- **Escalera ampliada a 0→6** (integra el trabajo de una sesión paralela, mergeado limpio sobre la topología global):
  - **N4 "El sistema trabaja para vos":** rutina + **conectar una herramienta por MCP** (mail/calendario) para que `triage` arme el brief con datos reales. No requiere programar.
  - **N5 "Orquestás":** qué es un orquestador (un skill que reparte a otros skills/subagentes y junta) — usás uno de ejemplo y armás el tuyo.
  - **N6 "Mantenés el sistema":** `auditar-sistema` (salud) + `evaluar-skill` (afinar). "Un sistema que no se revisa se pudre callado."
  - El **split código/contexto** pasa a ser una **rama opcional** ("si programás"), no un nivel que todos pasan.
- **`ESCALERA.md`** refleja la escalera 0→6 + el tip "preguntame lo que necesites primero" (que te entreviste en vez de adivinar el prompt).
- **Doctrina de skills más rica** (`arquitectura-skills.md`): "Si no se dispara" (debug: preguntá '¿cuándo usarías el skill X?'), "Cómo se arma un orquestador (N5)", "no hornees el tono adentro del skill". `crear-skill`: "arrancá de lo que ya hiciste (las 3 veces de la regla)" + paso de verificar el disparo.
- README (ambos) y `reference.md` actualizados a la escalera 0→6.

## 2.8.0
- **Todo el método a global; el SB queda con SOLO tu contenido (adiós `.secondbrain/`).** Dos baldes claros: el **método** se instala global (como una app) y tu **brain** (la carpeta) tiene solo lo tuyo.
  - El **coach lleva sus piezas adentro** de su carpeta global (`~/.claude/skills/second-brain-coach/`): `reference.md`, `plantilla-proyecto.md`, `ejemplos.md`, el catálogo `skills-disponibles/` y `VERSION`/`CHANGELOG`. Es el patrón de archivos bundled que el propio kit predica.
  - El SB del usuario ya **no tiene `.secondbrain/`**: solo `CLAUDE.md` + `ESTADO.md` + `ESCALERA.md` + `AGENTS.md`, las carpetas PARA + `0. Inbox`, la identidad, y `skills/` (los skills de uso, visibles).
  - Trade-off: el brain deja de ser 100% autocontenido — el método se instala por máquina (app), tu contenido sincroniza por Drive. La portabilidad del contenido + los skills (tabla del `CLAUDE.md`) no se toca.
- `install.sh`, coach, doctrina (`reference.md` §14), templates y READMEs reescritos al modelo de 2 baldes. `actualizar`/`check-update.sh` leen la `VERSION` instalada global (con `$HOME`, no `~` entre comillas).

## 2.7.1
- **Sacados `abrir-sesion` y `cerrar-sesion`** del catálogo: su valor ya está cubierto por el coach + `ESTADO.md` + `ESCALERA.md`. El catálogo de skills de uso queda en **6** (redactar, anti-slop, triage, crear-skill, evaluar-skill, auditar-sistema). El "briefear al abrir" lo hace el coach; el "capturar al cerrar" pasa a ser un **hábito** (dejar `ESTADO.md` + "próximo paso" al día), no un skill ceremonial. Limpieza de referencias en coach, doctrina, templates y READMEs.
- **Mapa definitivo:** motor del método (3, oculto/global, el usuario solo toca `/coach`) = `second-brain-coach` + `actualizar` + `migrar`. Skills de uso (6, visibles en el SB) = lo que el usuario usa en su trabajo.

## 2.7.0
- **Tracker de progreso gamificado `ESCALERA.md`** (visible, en la raíz): niveles 0→5 con checklist por nivel, "Nivel actual" + barra de progreso + "Próximo paso", y el "qué ganás" de cada nivel. El **coach lo mantiene**: tacha lo cumplido, mueve el nivel, escribe el próximo paso. Disparos nuevos del coach: *"¿cómo vengo?"* / *"mi progreso"* → muestra el tracker; *"¿qué hacemos hoy?"* / *"hola coach"* → lo lee y propone la próxima tarea. Al onboardear a alguien que **ya tiene sistema**, el coach evalúa el nivel mirando su carpeta y deja el tracker cargado (no lo hace empezar de cero). Separado del `ESTADO.md` (que sigue siendo el tablero fino que el asistente lee siempre).

## 2.6.1
- **`migrar-de-claude-projects` mejorado** (trabajo de una sesión paralela, integrado): suma el **camino export/bulk** para muchos Projects (con los límites reales del export oficial: todo-o-nada, los docs vienen como referencias no bytes, conversaciones como nodos `parent_message_uuid` a reconstruir, link de 24h), la **decisión PARA explícita** (Proyecto vs Área — muchos Claude Projects son Áreas), uso de `.secondbrain/plantilla-proyecto.md`, carpeta `historial/` para conversaciones, sección "Qué lee y escribe" y mejores señales de éxito.

## 2.6.0
- **Skills de uso movidos a `templates/skills/`** (no son del motor, son lo que se instala en el SB del usuario). En el repo, `.claude/skills/` queda SOLO con el motor (coach + actualizar + migrar); los skills de uso son el catálogo-fuente en `templates/skills/`. `install.sh` los fetchea de ahí.
- **Nuevo skill `evaluar-skill`** (versión genérica de un skill de evaluación de skills): mide un skill contra su propio `SKILL.md` (la rúbrica) en una corrida real y propone mejoras sin aplicarlas. Cierra el loop de calidad. El coach lo ofrece cuando ya tenés varios skills.
- **Skills de uso enriquecidos** para cumplir su propia arquitectura (auditoría de subagente): sección "Qué lee y escribe" en los que la omitían; `anti-slop` suma output con tabla de cambios + modo "Limpio ✅" + 5ª regla (meta-señalización) + troubleshooting + señales binarias; `auditar-sistema` suma reglas duras + output con formato fijo ("✅ Sin cambios necesarios" obligatoria + cierre de aprobación); `crear-skill` suma checklist de los 5 criterios mínimos; `redactar` suma loop de perfil-que-aprende; `triage` suma modo degradado.
- **soul.md vs proyecto — resuelto:** el bloque del proyecto pasa de "Cómo trabajar acá" a **"Rol acá"** (solo lo que cambia del soul). `soul.md` suma **"Qué manda cuando hay conflicto"** (precedencia explícita) + andamiaje de voz + "cómo evoluciona".
- **Templates menos pelados:** `mi-estilo.md` suma apertura/cierre/firma, tabla de adaptación por canal y "prohibido duro".
- **Ejemplos de referencia** (`templates/ejemplos.md` → `.secondbrain/ejemplos.md`): layouts por perfil (freelancer / pyme / PM / básico) que el coach usa al arrancar con alguien nuevo.
- **Coach goal-driven:** nueva sección "Tu objetivo: hacerlo avanzar" — el coach es proactivo, diagnostica, empuja al próximo escalón y no deja al usuario sin próximo paso.

## 2.5.1
- Fix de coherencia: el coach (`second-brain-coach`, ladder N3) todavía decía que el primer skill propio va en `.claude/skills/` — resto del modelo viejo que se contradecía con el resto del kit. Ahora dice `skills/` + su fila en la tabla "Mis skills", alineado con la doctrina de routing por tabla (v2.5.0).

## 2.5.0
- **Portabilidad real (Code + Cowork + Codex):** los skills de uso pasan a una **`skills/` a secas y visible** (sin `.claude/skills/`, sin symlink) y se disparan por la **tabla "Mis skills" del `CLAUDE.md`** (frase → skill). Como los tres harnesses leen el `CLAUDE.md` (Codex vía `AGENTS.md`), funcionan igual en todos. Antes el kit dependía de `.claude/skills/` (descubrimiento nativo de Claude), que **en Codex no dispara**. El patrón está tomado de un SB en uso real, que ya corría así (skills pelada + tabla del router).
- **`install.sh`:** crea `skills/` a secas (saca el symlink y el `.claude/skills/` del SB del usuario). El motor (3) sigue global e invisible; el catálogo (7 skills de uso) sigue en `.secondbrain/skills-disponibles/`.
- **Coach y `crear-skill`:** al sumar un skill, copian a `skills/<x>/` y **anotan la fila en la tabla "Mis skills"** — ese paso es ahora lo que lo hace disparar (no es cosmético; sin la fila, el skill no se activa).
- **`AGENTS.md`:** ahora le explica a Codex cómo usar la tabla de skills (antes solo apuntaba al `CLAUDE.md`).
- **Doctrina y READMEs** reescritos: el disparo es por la tabla del `CLAUDE.md`, no por carpeta oculta; el cerebro **y los skills de uso** son portables, y solo el comando `/second-brain-coach` queda atado a Claude.

## 2.4.0
- **Topología reescrita a 3 baldes** (matchea la regla: lo que el usuario usa = visible; el motor de armado = oculto):
  - **👁 Visible en el SB:** el contexto (PARA, identidad, `CLAUDE.md`, `ESTADO`, `Inbox`) + **`skills/` con los skills que el usuario USA**. No se instalan todos de una: el coach los va sumando a medida que el usuario avanza.
  - **🔒 Oculto en el SB (`.secondbrain/`):** doctrina (`reference.md`) + `plantilla-proyecto.md` + el **catálogo** `skills-disponibles/` (las versiones-fuente de los skills de uso) + versión.
  - **🔒 Global e invisible (`~/.claude/skills/`): SOLO el motor de armado** — coach + `actualizar` + `migrar`. Se llaman por nombre; no viven en la carpeta ni aparecen en `skills/`.
- **`install.sh`:** instala solo el motor (3) global y deja los 7 skills de uso en el catálogo oculto; crea `skills/` vacía. (Antes metía los 10 skills globales y dejaba `skills/` vacío.)
- **Coach:** nuevo mecanismo "Sumar un skill de uso (desde el catálogo)": copia `.secondbrain/skills-disponibles/<x>/` → `skills/<x>/` con OK, y lo anota en "Mis skills". Mapa de cuándo ofrecer cada uno (sesión temprano; redactar/anti-slop al escribir; crear-skill en N3; auditar/triage en N4).
- **Doctrina y READMEs** (`reference.md` §14, `arquitectura-skills.md`, ambos README) reescritos al modelo de 3 baldes, aclarando que `skills/` (visible) está respaldada por `.claude/skills/` (plomería de disparo).

## 2.3.0
- **`triage-mails` → `triage` (brief del día multi-fuente):** el skill deja de ser solo del inbox. Ahora arma un **brief** arriba (cómo viene el día en 2-4 líneas) y debajo los **accionables generales**, cruzando tus fuentes: mail (el piso), **calendario** (reporte de citas) y tu **chat/tareas** de trabajo (Slack, Jira, Linear, Trello, Notion comments, lo que uses). Es agnóstico al stack: trabaja con los MCP que tengas conectados y **ofrece** sumar calendario y chat/tareas la primera vez. Con el mail solo ya arranca; sigue siendo leer-y-proponer (no manda, no archiva, no cierra tickets sin OK). Renombrado en `install.sh`, ambos README y el coach (N4).

## 2.2.0
- **Skills de sesión (el play de retención):** `abrir-sesion` (lee `ESTADO.md` + el log reciente del proyecto y te briefea al retomar) y `cerrar-sesion` (al terminar deja el `ESTADO.md`, el log de decisiones y el **próximo paso** al día). Capturar al cerrar + retomar al abrir es lo que hace que la 2da sesión se sienta distinta. Inspirado en el "automatizá la disciplina" del deck de Muslera y en los handoff prompts de BMAD. Ruteados desde las reglas de arranque del `CLAUDE.md` raíz.
- **Persona por proyecto:** nueva plantilla `templates/proyecto-CLAUDE.md` (Qué es / **Cómo trabajar acá** / Estado / Decisiones / Próximo paso / Links). El `CLAUDE.md` de cada proyecto puede definir el carácter del asistente para ESE proyecto ("sé escéptico" / "sé breve"). El coach lo ofrece en N1; `install.sh` deja la plantilla en `.secondbrain/`.
- **Track avanzado (§16) ampliado:** multi-persona sobre una decisión (4 lentes → síntesis, estilo `council`) y el **loop de auto-mejora de skills** (patrón autoresearch de Karpathy: proponer cambio → correr `eval` como rúbrica → aplicar/descartar con tu OK).
- **Eval-first en `crear-skill`:** ofrece anotar 2-3 casos de prueba antes de escribir el skill (práctica #1 de la doctrina oficial de Anthropic).
- **Posicionamiento vs BMAD:** README y `reference.md` §12 aclaran que para desarrollo de software serio (epics/PRDs/equipo) se combina con un método de dev como BMAD-METHOD — no compiten, conviven en el split código/contexto (N5).

## 2.1.0
- **Fix de fondo (topología de skills):** los skills del usuario pasan a `.claude/skills/` (que es el único lugar donde el harness los descubre y los dispara por frontmatter). Antes vivían en un `skills/` pelado que Claude Code no escanea, así que **nunca se disparaban solos**. Queda un atajo visible `skills/` → `.claude/skills/` para verlos y editarlos, y la tabla "Mis skills" del `CLAUDE.md` como mapa humano. Se aclara en toda la doctrina la diferencia entre **disparo por frontmatter** y **ruteo por tabla**.
- **El motor ahora vive en `.claude/skills/` del repo:** abrir la carpeta (zip/clone) en Cowork deja el coach disponible al toque, sin terminal. El `install.sh` además lo deja global en `~/.claude/skills/` para Claude Code. Arregla el chicken-and-egg del camino sin terminal.
- **`actualizar` ahora viene hecho** como skill del kit (con `check-update.sh`): el auto-update pasa de promesa a algo que funciona. El Nivel 3 se reformula: leés el `actualizar` de ejemplo y después armás *tu* primer skill.
- **Captura/inbox:** nueva carpeta `0. Inbox/` con su `INBOX.md` (protocolo de capturar sin decidir y "cocinar" después). Se enseña temprano (Nivel 0). Tapaba el hueco más grande vs un PKM real.
- **`AGENTS.md`** incluido (puntero a `CLAUDE.md`): instrumenta la portabilidad multi-harness que el README prometía. Se matiza el claim "agnóstico": el *cerebro* (texto) es portable; el *motor* (skills/comandos) es de Claude.
- **`install.sh` robusto:** descarga atómica a tempdir (si algo falla, no deja el sistema a medias), precheck de red, y deja de pisar `reference.md` y lo tuyo. Resumen final con próximo paso.
- **Nivel 4 con sustancia:** se enseña el **log de corrida** ("una rutina sin log es ciega").
- **README:** la propuesta de valor sube al primer renglón (el ángulo "cerebro para tu asistente") y la escalera suma columna "qué ganás".
- **Alineación con mejores prácticas externas** (Anthropic, Karpathy, kepano, Simon Willison, deck Bluelabel de Muslera): doctrina de skills en 3ª persona + nombre en gerundio + divulgación progresiva (`arquitectura-skills.md`); `reference.md` nombra el *context rot* y el `CLAUDE.md` como "RAM curada" (§13), el learning-loop "el modelo es stateless, los archivos no" (§4), MCP=plomería/skills=cerebro + nota del combo riesgoso (§17); gancho de la "2da sesión" en README y coach.

## 2.0.6
- `soul.md` pasa a ser una **hoja de personaje** (formato SOUL.md): identidad, verdades de base, cómo veo las cosas, voz y tono, límites. Define quién es el asistente cuando habla por vos, no solo tus valores pasivos. El coach ahora ofrece guardar también opiniones marcadas, voz y líneas que no se cruzan.

## 2.0.5
- Aclarado dónde viven los skills: los **generales** en `skills/` (raíz del SB), los **de un proyecto** en `1. Proyectos/<proyecto>/skills/`. No van en `3. Recursos/` (eso es referencia). Doctrina en `arquitectura-skills.md`.

## 2.0.4
- Los skills que arma el usuario ahora son **visibles**: viven en `skills/` de su carpeta (no más en el oculto `.claude/skills/`) y se rutean desde el `CLAUDE.md` raíz (sección "Mis skills"). El motor del kit (coach y demás) sigue global y oculto, que es la máquina.

## 2.0.3
- La doctrina de skills sale a la luz como **Recurso visible**: `3. Recursos/arquitectura-skills.md` (regla de 3, DET/LAT, anatomía, errores típicos, checklist). El `reference.md` oculto la resume y apunta ahí; el `crear-skill` la usa.

## 2.0.2
- Los skills del kit (el motor que usa el coach) van globales en `~/.claude/skills/`; los skills que el usuario arma quedan en `.claude/skills/` de su SB y viajan con él.
- README: el sistema es agnóstico al modelo y al harness (Claude Code, Cowork, Codex, Cursor, lo que venga). El cerebro son archivos de texto, portables.

## 2.0.1
- Footprint mínimo: la raíz queda con `CLAUDE.md` + `ESTADO.md`; los básicos de identidad (`sobre-mi`, `como-trabajo`, `mi-estilo`, `MEMORIA`) viven en PARA, en `2. Áreas/yo/`. `soul` y `dev-prefs` los suma el coach a medida que subís.

## 2.0.0
- Coach renombrado a `second-brain-coach`: es el punto de entrada único del sistema.
- Apertura en 3 modos (aprender / hacelo por mí / hacelo yo) + perilla de experiencia (en bolas / avanzado).
- El coach enseña el concepto de cada escalón, no solo te ubica.
- Onboarding: pregunta si ya tenés una carpeta de trabajo; si sí, la analiza y la adopta sin pisar nada.
- Escalera ampliada: se suma Nivel 4 (rutinas); el split código pasa a Nivel 5.
- Auto-update: tu primer skill es el chequeador de updates del kit (de paso aprendés qué es un script).
- Liviano para correr: el `CLAUDE.md` raíz pasa a router fino + `ESTADO.md` como tablero.
- Topología: el proceso vive oculto en `.secondbrain/`; a la vista quedan solo tus entregables.
- Templates nuevos: `soul.md` (se llena hablando) + `dev-prefs.md`.
- Skills-joya dormidos: `crear-skill`, `auditar-sistema`, `triage-mails`, `migrar-de-claude-projects`.
- Sirve al principiante y al avanzado (track "más allá" opt-in); pensado para Cowork, migra a Code.

## 1.0.0
- Versión inicial: PARA, super MD, `reference.md`, skills (coach / redactar / anti-slop), templates, `install.sh`.
