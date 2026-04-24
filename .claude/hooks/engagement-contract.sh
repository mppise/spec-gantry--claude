#!/usr/bin/env bash
# SpecGantry engagement contract — runs at SessionStart + PostCompact

set -euo pipefail

# --- Helpers to emit hook JSON blobs safely ---
emit_error() {
    python3 -c "import json,sys; print(json.dumps({'hookSpecificOutput':{'hookEventName':'SessionStart','additionalContext':sys.argv[1]}}))" "$1"
}

emit_session() {
    python3 -c "import json,sys; print(json.dumps({'suppressOutput':True,'hookSpecificOutput':{'hookEventName':sys.argv[1],'additionalContext':sys.argv[2]}}))" "$1" "$2"
}

emit_compact() {
    python3 -c "import json,sys; print(json.dumps({'suppressOutput':True,'additionalContext':sys.argv[1]}))" "$1"
}

CONTRACT_PATH="${CLAUDE_PROJECT_DIR:-.}/.claude/CONTRACT.md"
if [[ ! -f "$CONTRACT_PATH" ]]; then
  emit_error "❌ SpecGantry: CONTRACT.md not found. Engagement contract could not be loaded — do not proceed until this is resolved."
  exit 1
fi

HOOK_EVENT=$(python3 -c "import json,sys; d=sys.stdin.read().strip(); print(json.loads(d).get('hook_event_name','SessionStart') if d else 'SessionStart')" 2>/dev/null || echo "SessionStart")
CONTENT=$(< "$CONTRACT_PATH")

if [[ "$HOOK_EVENT" == "PostCompact" ]]; then
  emit_compact "$CONTENT"
else
  emit_session "$HOOK_EVENT" "$CONTENT"
fi
