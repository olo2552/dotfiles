LAST_BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
git reset --hard
git checkout -
echo "Deleting last temp branch: $LAST_BRANCH_NAME"
git branch -d $LAST_BRANCH_NAME
