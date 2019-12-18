 #!/bin/bash
 git checkout develop
 git pull
 destinationBranch=`git rev-parse --abbrev-ref HEAD`
 reviewBranch=$1
 git fetch origin
 git stash -u
 git checkout -B temp_review_branch_$reviewBranch origin/$destinationBranch
 git merge --no-ff -m "You shouldn\'t see this! It means author pushed changes which suppose to be just reviewed." origin/$reviewBranch
 git reset HEAD^
 git add -A
