#!/usr/bin/env bash
#
# SecondBrain installer
# https://github.com/brunogiel/secondbrain-claude
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/brunogiel/secondbrain-claude/main/install.sh | bash
#
# What it does:
#   1. Creates your PARA folders in the current directory.
#   2. Drops the starter templates (won't overwrite files you already have).
#   3. Installs the skills globally in ~/.claude/skills/ so they work in every project.
#
set -euo pipefail

REPO="brunogiel/secondbrain-claude"   # confirm the final repo slug here
BRANCH="main"
RAW="https://raw.githubusercontent.com/${REPO}/${BRANCH}"

TEMPLATES=("CLAUDE.md" "sobre-mi.md" "como-trabajo.md" "reference.md" "mi-estilo.md" "MEMORIA.md")
SKILLS=("second-brain-coach" "redactar" "anti-slop")
SKILLS_DIR="${HOME}/.claude/skills"

echo ""
echo "🧠  SecondBrain — armando tu sistema..."
echo ""

# 1. PARA folders
for d in "1. Proyectos" "2. Áreas" "3. Recursos" "4. Archivo"; do
  mkdir -p "$d"
done
echo "  ✓ carpetas PARA creadas"

# 2. Templates (skip if already present, never overwrite your content)
for f in "${TEMPLATES[@]}"; do
  if [ -e "$f" ]; then
    echo "  • $f ya existe, lo dejo como está"
  else
    curl -fsSL "${RAW}/templates/${f}" -o "$f"
    echo "  ✓ $f"
  fi
done

# 3. Skills (global)
mkdir -p "$SKILLS_DIR"
for s in "${SKILLS[@]}"; do
  mkdir -p "${SKILLS_DIR}/${s}"
  curl -fsSL "${RAW}/skills/${s}/SKILL.md" -o "${SKILLS_DIR}/${s}/SKILL.md"
  echo "  ✓ skill instalado: ${s}"
done

echo ""
echo "Listo. Abrí Claude Code (o Cowork) en esta carpeta y escribí:  /second-brain-coach"
echo ""
