#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE="$ROOT/skills"
TARGET="$ROOT/.opencode/skills"

usage() {
  cat <<'USAGE'
Usage:
  ./scripts/sync-opencode-skills.sh          Create the flat OpenCode skill folders
  ./scripts/sync-opencode-skills.sh --check  Verify the generated folders match source
  ./scripts/sync-opencode-skills.sh --clean  Remove generated skill folders
USAGE
}

mode="${1:-sync}"
case "$mode" in
  sync|--check|--clean|-h|--help) ;;
  *) usage >&2; exit 2 ;;
esac

if [[ "$mode" == "-h" || "$mode" == "--help" ]]; then
  usage
  exit 0
fi

if [[ ! -d "$SOURCE" ]]; then
  echo "Missing source skill folder: $SOURCE" >&2
  exit 1
fi

mkdir -p "$TARGET"

clean_generated() {
  find "$TARGET" -mindepth 1 -maxdepth 1 ! -name README.md -exec rm -rf -- {} +
}

skill_name_from_file() {
  sed -n 's/^name:[[:space:]]*//p' "$1" | head -n 1 | tr -d '"'\'' '
}

validate_source() {
  local count=0
  while IFS= read -r skill_file; do
    local skill_dir skill_name dir_name
    skill_dir="$(dirname "$skill_file")"
    dir_name="$(basename "$skill_dir")"
    skill_name="$(skill_name_from_file "$skill_file")"

    if [[ -z "$skill_name" ]]; then
      echo "Missing name frontmatter: ${skill_file#$ROOT/}" >&2
      return 1
    fi

    if [[ "$skill_name" != "$dir_name" ]]; then
      echo "Skill name mismatch: ${skill_file#$ROOT/} has name '$skill_name'" >&2
      return 1
    fi

    if ! grep -q '^description:[[:space:]]*.' "$skill_file"; then
      echo "Missing description frontmatter: ${skill_file#$ROOT/}" >&2
      return 1
    fi

    count=$((count + 1))
  done < <(find "$SOURCE" -mindepth 3 -maxdepth 3 -name SKILL.md -print | sort)

  if [[ "$count" -eq 0 ]]; then
    echo "No grouped skills found under $SOURCE" >&2
    return 1
  fi

  echo "$count"
}

check_generated() {
  local source_count target_count
  source_count="$(validate_source)"
  target_count="$(find "$TARGET" -mindepth 2 -maxdepth 2 -name SKILL.md -print | wc -l | tr -d ' ')"

  if [[ "$source_count" != "$target_count" ]]; then
    echo "Skill count mismatch: source=$source_count generated=$target_count" >&2
    return 1
  fi

  while IFS= read -r skill_file; do
    local skill_dir skill_name target_skill
    skill_dir="$(dirname "$skill_file")"
    skill_name="$(skill_name_from_file "$skill_file")"
    target_skill="$TARGET/$skill_name/SKILL.md"

    if [[ ! -f "$target_skill" ]]; then
      echo "Missing generated skill: .opencode/skills/$skill_name/SKILL.md" >&2
      return 1
    fi

    if ! diff -qr "$skill_dir" "$TARGET/$skill_name" >/dev/null; then
      echo "Generated skill is stale: .opencode/skills/$skill_name" >&2
      return 1
    fi
  done < <(find "$SOURCE" -mindepth 3 -maxdepth 3 -name SKILL.md -print | sort)

  echo "OK: $source_count OpenCode skills are generated and current."
}

if [[ "$mode" == "--clean" ]]; then
  clean_generated
  echo "Removed generated OpenCode skill folders."
  exit 0
fi

if [[ "$mode" == "--check" ]]; then
  check_generated
  exit 0
fi

source_count="$(validate_source)"
clean_generated

while IFS= read -r skill_file; do
  skill_dir="$(dirname "$skill_file")"
  skill_name="$(skill_name_from_file "$skill_file")"
  cp -R "$skill_dir" "$TARGET/$skill_name"
done < <(find "$SOURCE" -mindepth 3 -maxdepth 3 -name SKILL.md -print | sort)

echo "Generated $source_count OpenCode skills in .opencode/skills/."
