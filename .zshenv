function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}
. "$HOME/.cargo/env"


function git_since() {
    git log --merges --since=$1 --pretty=format:"%h - %s (%cd)" --date=short
}

function commit {

    git add .

    echo -n "Enter a commit message: "
    read commit_message

    if [ -n "$commit_message" ]; then
        git commit -m "$commit_message"
        git push
    fi
}