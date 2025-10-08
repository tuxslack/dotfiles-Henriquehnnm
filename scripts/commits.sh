#!/bin/bash
# HydroCommits Generator - Interactive script for crafting HydroGit-compliant commits.

# --- Safety Checks ---
# Ensure it's a git repository
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  echo "🛑 Not a git repository. Exiting."
  exit 1
fi

# Check for staged changes
STAGED_FILES=$(git diff --cached --name-only)
if [ -z "$STAGED_FILES" ]; then
  echo "🤔 No staged changes found. Use 'git add' to stage files for commit."
  exit 1
fi

echo "✨ Generating HydroCommit for the following staged files:"
echo "$STAGED_FILES" | sed 's/^/  - /'
echo

# --- 1. Action Selection ---
echo "Step 1: What was the main action?"
ACTIONS=("Add" "Tune" "Fix" "Remove" "Polish" "Document" "Reveal" "Hide")
PS3="Select an action (e.g., 1 for Add): "
select ACTION in "${ACTIONS[@]}"; do
  if [[ -n "$ACTION" ]]; then
    break
  else
    echo "Invalid choice. Please select a number from 1 to ${#ACTIONS[@]}.";
  fi
done

# --- 2. Scope Detection & Input ---
echo
echo "Step 2: What was the scope of this change?"

# Find the longest common path prefix for all staged files
files_array=($STAGED_FILES)
# Get the directory of the first file as the initial prefix
common_path=$(dirname "${files_array[0]}")

for file in $STAGED_FILES; do
    # While the current file path doesn't start with the common_path
    while [[ "${file#$common_path}" == "$file" ]]; do
        # Go one level up in the directory tree
        common_path=$(dirname "$common_path")
        # If we reached the root ('.'), stop.
        if [[ "$common_path" == "." ]]; then
            break
        fi
    done
    if [[ "$common_path" == "." ]]; then
        break
    fi
done

# If the common path is '.', suggest 'dotfiles' (project-level) or 'root'
if [[ "$common_path" == "." ]] || [[ -z "$common_path" ]]; then
    SUGGESTED_SCOPE="dotfiles"
else
    SUGGESTED_SCOPE=$common_path
fi

read -p "Enter scope (suggestion: $SUGGESTED_SCOPE): " SCOPE
SCOPE=${SCOPE:-$SUGGESTED_SCOPE}

# --- 3. Short Description Input ---
echo
echo "Step 3: Write a short, human-friendly description."
read -p "Description: " DESCRIPTION

# --- 4. Body Input (Optional) ---
echo
read -p "Step 4: Add a more detailed body? (y/N) " ADD_BODY
BODY=""
if [[ "$ADD_BODY" =~ ^[Yy]$ ]]; then
  echo "Enter body text. Press Ctrl+D on a new line to finish."
  BODY=$(cat)
fi

# --- 5. Emoji Selection (Optional) ---
echo
echo "Step 5: Choose a final emoji to add some flair!"
EMOJIS=("🌊" "🔥" "✨" "💫" "none")
PS3="Select an emoji (e.g., 3 for ✨): "
select EMOJI_CHOICE in "${EMOJIS[@]}"; do
  if [[ -n "$EMOJI_CHOICE" ]]; then
    break
  else
    echo "Invalid choice. Please select a number from 1 to ${#EMOJIS[@]}.";
  fi
done

EMOJI=""
if [ "$EMOJI_CHOICE" != "none" ]; then
  EMOJI=" $EMOJI_CHOICE"
fi

# --- 6. Assemble and Display Commit Message ---
HEADER="$ACTION($SCOPE): $DESCRIPTION$EMOJI"

echo
echo "🎉 Done! Here is your generated HydroCommit message:"
echo "----------------------------------------------------"
if [ -n "$BODY" ]; then
  echo -e "$HEADER\n\n$BODY"
else
  echo "$HEADER"
fi
echo "----------------------------------------------------"
echo
echo "To commit, you can copy the message above or run this command:"
echo
echo "cat <<EOM | git commit -F -"
if [ -n "$BODY" ]; then
    echo -e "$HEADER\n\n$BODY"
else
    echo "$HEADER"
fi
echo "EOM"
echo
