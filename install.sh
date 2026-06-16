#!/usr/bin/env bash
#
# SecondBrain installer
# https://github.com/brunogiel/secondbrain-claude
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/brunogiel/secondbrain-claude/main/install.sh | bash
#
# What it does (keeps your folder clean: you only see your own stuff):
#   1. Creates your PARA folders.
#   2. Drops the essentials: CLAUDE.md (router) + ESTADO.md at the root, and your
#      identity basics inside PARA, under "2. Áreas/yo/" (sobre-mi, como-trabajo,
#      mi-estilo, MEMORIA). The rest (soul, dev-prefs) the coach adds as you climb.
#   3. Sets up the hidden .secondbrain/ folder (the process: doctrine + version).
#   4. Installs the KIT skills globally in ~/.claude/skills/ (the engine, so the coach works
#      everywhere). The skills YOU build later live in .claude/skills/ of your SB folder and
#      travel with it.
# After install, open Claude Code (or Cowork) here and type:  /second-brain-coach
set -euo pipefail

REPO="brunogiel/secondbrain-claude"   # confirm the final repo slug here
BRANCH="main"
RAW="https://raw.githubusercontent.com/${REPO}/${BRANCH}"

# Root system files (visible): the router + the dashboard.
ROOT_FILES=("CLAUDE.md" "ESTADO.md")
# Identity basics (non-negotiable), in PARA under 2. Áreas/yo/.
YO_DIR="2. Áreas/yo"
YO_FILES=("sobre-mi.md" "como-trabajo.md" "mi-estilo.md" "MEMORIA.md")
# Kit skills = the engine the coach needs to work. Global, reinstalled with the kit on each
# machine. The skills YOU build later live in .claude/skills/ of your SB folder and travel with it.
SKILLS=("second-brain-coach" "redactar" "anti-slop" "crear-skill" "auditar-sistema" "triage-mails" "migrar-de-claude-projects")
SKILLS_DIR="${HOME}/.claude/skills"
SB_DIR=".secondbrain"

echo ""
echo "🧠  SecondBrain — armando tu sistema..."
echo ""

# 1. PARA folders
for d in "1. Proyectos" "2. Áreas" "3. Recursos" "4. Archivo"; do
  mkdir -p "$d"
done
echo "  ✓ carpetas PARA creadas"

# 2. Root system files (skip if present)
for f in "${ROOT_FILES[@]}"; do
  if [ -e "$f" ]; then
    echo "  • $f ya existe, lo dejo como está"
  else
    curl -fsSL "${RAW}/templates/${f}" -o "$f"
    echo "  ✓ $f"
  fi
done

# 3. Identity basics in PARA (2. Áreas/yo/), skip if present
mkdir -p "$YO_DIR"
for f in "${YO_FILES[@]}"; do
  if [ -e "${YO_DIR}/${f}" ]; then
    echo "  • ${YO_DIR}/${f} ya existe, lo dejo como está"
  else
    curl -fsSL "${RAW}/templates/${f}" -o "${YO_DIR}/${f}"
    echo "  ✓ ${YO_DIR}/${f}"
  fi
done

# 4. Hidden process folder (.secondbrain/): doctrine + version. No se ve en Finder, sincroniza igual.
mkdir -p "$SB_DIR"
curl -fsSL "${RAW}/process/reference.md" -o "${SB_DIR}/reference.md"
curl -fsSL "${RAW}/VERSION"              -o "${SB_DIR}/VERSION"
curl -fsSL "${RAW}/CHANGELOG.md"         -o "${SB_DIR}/CHANGELOG.md"
echo "  ✓ proceso oculto en ${SB_DIR}/"

# 5. Kit skills, global (~/.claude/skills/): the engine. Tus propios skills (los que armás
#    después) viven en .claude/skills/ de esta carpeta y viajan con tu SB.
mkdir -p "$SKILLS_DIR"
for s in "${SKILLS[@]}"; do
  mkdir -p "${SKILLS_DIR}/${s}"
  curl -fsSL "${RAW}/skills/${s}/SKILL.md" -o "${SKILLS_DIR}/${s}/SKILL.md"
  echo "  ✓ skill instalado: ${s}"
done

echo ""
echo "Listo. Abrí Claude Code (o Cowork) en esta carpeta y escribí:  /second-brain-coach"
echo ""
