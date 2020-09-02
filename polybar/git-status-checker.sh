#!/bin/sh

ROOT_REPO_DIRECTORY_PATH="$HOME/repos"
MAX_DEPTH_REPOSITORY_TRAVERSAL=5


total_current_branch_commits_behind=0
total_current_branch_commits_ahead=0
total_commits_unpushed=0

analyzeRepo () {
    pathToRepo=$1
    #echo $pathToRepo
    cd $pathToRepo
    CURRENT_BRANCH_STATUS=$(git status -sb)
    CURRENT_BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
    CURRENT_BRANCH_UPSTREAM=$(git rev-parse --abbrev-ref $CURRENT_BRANCH_NAME@{upstream})
    CURRENT_BRANCH_BEHIND_AHEAD=$(git rev-list --left-right --count $CURRENT_BRANCH_UPSTREAM...$CURRENT_BRANCH_NAME | awk '{print $1","$2}')
    COMMITS_NOT_PUSHED_ON_LOCAL_BRANCHES=$(git log --branches --not --remotes)
    COMMITS_NOT_PUSHED_ON_LOCAL_BRANCHES_CONCISE=$(git cherry -v)
    COMMITS_NOT_PUSHED_ON_LOCAL_BRANCHES_NUMBER=$(git cherry -v | wc -l)

    [[ $CURRENT_BRANCH_BEHIND_AHEAD =~ ^(.*),(.*)$ ]]
    current_branch_commits_behind=${BASH_REMATCH[1]}
    current_branch_commits_ahead=${BASH_REMATCH[2]}
    total_current_branch_commits_behind=$(($totalCommitsBehind + $current_branch_commits_behind))
    total_current_branch_commits_ahead=$(($totalCommitsAhead + $current_branch_commits_ahead))

    
    total_commits_unpushed=$(($total_commits_unpushed + $COMMITS_NOT_PUSHED_ON_LOCAL_BRANCHES_NUMBER))

    return 0
}

allRepos=$(find $ROOT_REPO_DIRECTORY_PATH -maxdepth $MAX_DEPTH_REPOSITORY_TRAVERSAL -type d -name "*.git")
for file in $allRepos; do
	repoPath=$(dirname $file)
    analyzeRepo $repoPath
done

if [ $total_commits_unpushed -gt 0 ]; then
    echo " Unpushed commits ($total_commits_unpushed) "
else
    echo " No unsaved commits "
fi
