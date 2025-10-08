#!/bin/bash
# HydroCommits Generator - Automated script for crafting HydroGit-compliant commits.

# --- Safety Checks ---
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  echo "🛑 Not a git repository. Exiting."
  exit 1
fi

STAGED_FILES=$(git diff --cached --name-only)
if [ -z "$STAGED_FILES" ]; then
  echo "🤔 No staged changes found. Use 'git add' to stage files for commit."
  exit 1
fi

echo "✨ Generating HydroCommit for the following staged files:"
echo "$STAGED_FILES" | sed 's/^/  - /'
echo

# --- 1. Action Detection ---
STAGED_STATUS=$(git diff --cached --name-status)
ACTION="Tune" # Default action
EMOJI="💫"

if echo "$STAGED_STATUS" | grep -q -E '^A\s'; then
    ACTION="Add"
    EMOJI="✨"
elif echo "$STAGED_STATUS" | grep -q -E '^D\s'; then
    ACTION="Remove"
    EMOJI="🔥"
else
    # Check if all files are docs
    IS_DOC_CHANGE=true
    while read -r file; do
        if [[ ! "$file" =~ \.md$ ]] && [[ ! "$file" =~ LICENSE ]]; then
            IS_DOC_CHANGE=false
            break
        fi
    done <<< "$STAGED_FILES"

    if [ "$IS_DOC_CHANGE" = true ]; then
        ACTION="Document"
        EMOJI="🌊"
    fi
fi

# --- 2. Scope Detection ---
files_array=($STAGED_FILES)
common_path=$(dirname "${files_array[0]}")

for file in $STAGED_FILES; do
    while [[ "${file#$common_path}" == "$file" ]]; do
        common_path=$(dirname "$common_path")
        if [[ "$common_path" == "." ]]; then
            break
        fi
    done
    if [[ "$common_path" == "." ]]; then
        break
    fi
done

if [[ "$common_path" == "." ]] || [[ -z "$common_path" ]]; then
    SCOPE="dotfiles"
else
    SCOPE=$common_path
fi

# --- 3. Short Description Generation ---
NUM_FILES=$(echo "$STAGED_FILES" | wc -l)
if [ "$NUM_FILES" -eq 1 ]; then
    FILENAME=$(basename "$STAGED_FILES")
    DESCRIPTION="updates to $FILENAME"
else
    DESCRIPTION="updates in $SCOPE"
fi

# --- 4. Body Generation ---
BODY="Changes:"
BODY+=$(echo "$STAGED_FILES" | sed 's/^/\n- /')


# --- 5. Assemble and Display Commit Message ---
HEADER="$ACTION($SCOPE): $DESCRIPTION $EMOJI"
COMMIT_MSG=$(echo -e "$HEADER\n\n$BODY")

echo
echo "🎉 Done! Here is your generated HydroCommit message:"

if command -v gum &> /dev/null; then
    gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "$COMMIT_MSG"
else
    echo "----------------------------------------------------"
    echo "$COMMIT_MSG"
    echo "----------------------------------------------------"
    echo "💡 Install 'gum' for a prettier output."
fi
echo
