#!/usr/bin/env bash
#
# SecondBrain installer
# https://github.com/brunogiel/secondbrain-claude
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/brunogiel/secondbrain-claude/main/install.sh | bash
#
# Qué hace (deja tu carpeta limpia: ves solo lo tuyo):
#   1. Crea tus carpetas PARA + la bandeja de captura (0. Inbox).
#   2. Deja lo esencial: CLAUDE.md (router) + ESTADO.md + AGENTS.md (puntero para otros
#      harnesses) en la raíz, y tu identidad en PARA, bajo "2. Áreas/yo/".
#   3. Arma la carpeta oculta .secondbrain/ (el proceso: doctrina + versión).
#   4. Instala el MOTOR (los skills del kit, incluido el coach) global en ~/.claude/skills/,
#      así el coach funciona en cualquier carpeta. Tus skills propios van después en
#      .claude/skills/ de tu SB (que es donde el asistente los descubre) y se ven desde
#      la tabla "Mis skills" del CLAUDE.md. Se crea un atajo visible skills/ que apunta ahí.
# Descarga atómica: si algo falla, no te deja el sistema a medio armar.
# Después: abrí Claude Code (o Cowork) acá y escribí  /second-brain-coach
set -euo pipefail

REPO="brunogiel/secondbrain-claude"
BRANCH="main"
RAW="https://raw.githubusercontent.com/${REPO}/${BRANCH}"

# --- qué se baja ---
ROOT_FILES=("CLAUDE.md" "ESTADO.md" "AGENTS.md")          # raíz, visibles
YO_DIR="2. Áreas/yo"
YO_FILES=("sobre-mi.md" "como-trabajo.md" "mi-estilo.md" "MEMORIA.md")
# El motor: los skills del kit. Global, se reinstala con el kit en cada máquina.
SKILLS=("second-brain-coach" "abrir-sesion" "cerrar-sesion" "actualizar" "redactar" "anti-slop" "crear-skill" "auditar-sistema" "triage" "migrar-de-claude-projects")
SKILLS_DIR="${HOME}/.claude/skills"
SB_DIR=".secondbrain"

echo ""
echo "🧠  SecondBrain — armando tu sistema..."
echo ""

# --- 0. precheck de red: si no hay conexión, frenamos ANTES de crear nada ---
if ! curl -fsSL "${RAW}/VERSION" -o /dev/null 2>/dev/null; then
  echo "  ✗ No pude conectar con GitHub. Revisá tu internet y volvé a correr el comando."
  echo "    (No toqué nada todavía.)"
  exit 1
fi

# --- descarga atómica: bajamos todo a un tempdir y recién al final movemos ---
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

fetch() {  # fetch <ruta-en-repo> <destino-en-tmp>
  mkdir -p "$(dirname "${TMP}/$2")"
  if ! curl -fsSL "${RAW}/$1" -o "${TMP}/$2"; then
    echo "  ✗ Falló la descarga de $1. Instalación cancelada (no quedó nada a medias)."
    exit 1
  fi
}

echo "  ↓ bajando archivos..."
for f in "${ROOT_FILES[@]}";  do fetch "templates/${f}" "root/${f}"; done
for f in "${YO_FILES[@]}";    do fetch "templates/${f}" "yo/${f}";   done
fetch "templates/arquitectura-skills.md" "recursos/arquitectura-skills.md"
fetch "templates/INBOX.md"               "inbox/INBOX.md"
fetch "templates/proyecto-CLAUDE.md"     "sb/plantilla-proyecto.md"
fetch "process/reference.md"             "sb/reference.md"
fetch "VERSION"                          "sb/VERSION"
fetch "CHANGELOG.md"                     "sb/CHANGELOG.md"
for s in "${SKILLS[@]}"; do fetch ".claude/skills/${s}/SKILL.md" "skills/${s}/SKILL.md"; done
# script opcional del skill actualizar (no aborta si no está)
mkdir -p "${TMP}/skills/actualizar"
curl -fsSL "${RAW}/.claude/skills/actualizar/check-update.sh" -o "${TMP}/skills/actualizar/check-update.sh" 2>/dev/null || true

# --- a partir de acá ya tenemos todo: movemos a destino ---

# 1. Carpetas PARA + bandeja de captura
for d in "0. Inbox" "1. Proyectos" "2. Áreas" "3. Recursos" "4. Archivo"; do
  mkdir -p "$d"
done
echo "  ✓ carpetas PARA + 0. Inbox"

place() {  # place <archivo-en-tmp> <destino>  — no pisa si ya existe
  if [ -e "$2" ]; then
    echo "  • $2 ya existe, lo dejo como está"
  else
    mkdir -p "$(dirname "$2")"
    cp "${TMP}/$1" "$2"
    echo "  ✓ $2"
  fi
}

# 2. Raíz (router + tablero + puntero AGENTS)
for f in "${ROOT_FILES[@]}"; do place "root/${f}" "$f"; done

# 3. Identidad en PARA
for f in "${YO_FILES[@]}"; do place "yo/${f}" "${YO_DIR}/${f}"; done

# 3b. Recursos que vienen llenos + protocolo de inbox
place "recursos/arquitectura-skills.md" "3. Recursos/arquitectura-skills.md"
place "inbox/INBOX.md"                  "0. Inbox/INBOX.md"

# 4. Proceso oculto (.secondbrain/). reference.md NO se pisa (lo puede editar el coach);
#    VERSION y CHANGELOG sí se refrescan (son el estado del kit).
mkdir -p "$SB_DIR"
place "sb/reference.md"          "${SB_DIR}/reference.md"
place "sb/plantilla-proyecto.md" "${SB_DIR}/plantilla-proyecto.md"
cp "${TMP}/sb/VERSION"      "${SB_DIR}/VERSION"
cp "${TMP}/sb/CHANGELOG.md" "${SB_DIR}/CHANGELOG.md"
echo "  ✓ proceso oculto en ${SB_DIR}/"

# 5. El motor: skills del kit, global. Se refrescan siempre (querés la última).
mkdir -p "$SKILLS_DIR"
for s in "${SKILLS[@]}"; do
  mkdir -p "${SKILLS_DIR}/${s}"
  cp "${TMP}/skills/${s}/SKILL.md" "${SKILLS_DIR}/${s}/SKILL.md"
done
[ -f "${TMP}/skills/actualizar/check-update.sh" ] && cp "${TMP}/skills/actualizar/check-update.sh" "${SKILLS_DIR}/actualizar/check-update.sh"
echo "  ✓ motor instalado (${#SKILLS[@]} skills en ~/.claude/skills/)"

# 6. Carpeta para TUS skills: .claude/skills/ (donde el asistente los descubre) + atajo visible.
mkdir -p ".claude/skills"
if [ ! -e "skills" ]; then
  ln -s ".claude/skills" "skills" 2>/dev/null && echo "  ✓ atajo visible skills/ → .claude/skills/" || true
fi

cat <<EOF

✅  Listo. Se armó tu SecondBrain:
   • 5 carpetas (0. Inbox + PARA)  • CLAUDE.md + ESTADO.md + AGENTS.md
   • tu identidad en "2. Áreas/yo/"  • el motor (${#SKILLS[@]} skills) en ~/.claude/skills/

Próximo paso: abrí Claude Code (o Cowork) en esta carpeta y escribí:

   /second-brain-coach

Te hace un par de preguntas y arranca, de a un escalón.

EOF
