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
