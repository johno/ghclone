#!/usr/bin/env sh

if ! [ $1 ]; then
  echo "GitHub clone shortcut\n\n"
  echo "Usage:\n  $ ghclone <username>/<repo>\n\n"
  echo "Example:\n  $ ghclone johnotander/pixyll\n"
  exit 1
fi

if [ $2 ]; then
  GITDIR=${2}
else
  TOKENS=$(echo $1 | tr "/" "\n")

  for T in $TOKENS 
  do
    LAST_TOKEN=$T
  done

  GITDIR=$LAST_TOKEN
fi

git clone https://github.com/${1}.git ${GITDIR}
cd ${GITDIR}
