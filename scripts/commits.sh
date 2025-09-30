#!/bin/bash
# Conventional Commit Generator based on staged changes

# Check for git repo
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  echo "Not inside a git repository."
  exit 1
fi

# Check for staged changes
if ! git diff --cached --quiet; then
  # Collect staged changes
  ADDED=$(git diff --cached --name-status | awk '$1=="A"{print $2}')
  MODIFIED=$(git diff --cached --name-status | awk '$1=="M"{print $2}')
  DELETED=$(git diff --cached --name-status | awk '$1=="D"{print $2}')
else
  echo "No staged changes detected. Please stage your changes with git add."
  exit 1
fi

# Determine type (feat, fix, chore, etc.)
TYPE="chore"
if [ -n "$ADDED" ]; then TYPE="feat"; fi
if [ -n "$MODIFIED" ]; then TYPE="fix"; fi
if [ -n "$DELETED" ]; then TYPE="refactor"; fi

# Build summary
SUMMARY=""
[ -n "$ADDED" ] && SUMMARY+="Add: $(echo $ADDED | tr '\n' ',' | sed 's/,$//') "
[ -n "$MODIFIED" ] && SUMMARY+="Update: $(echo $MODIFIED | tr '\n' ',' | sed 's/,$//') "
[ -n "$DELETED" ] && SUMMARY+="Remove: $(echo $DELETED | tr '\n' ',' | sed 's/,$//') "

# Clean summary
SUMMARY=$(echo "$SUMMARY" | sed 's/ *$//')

# Compose commit message
COMMIT_MSG="$TYPE: $SUMMARY"

echo "Suggested commit message:"
echo
echo "$COMMIT_MSG"
echo
echo "To commit, run:"
echo "  git commit -m \"$COMMIT_MSG\""
