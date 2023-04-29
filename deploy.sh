#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# hugo build
hugo -t mainroad --environment production

# public repository push
cd public
git add .

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
git push origin main

# henry-blog repository  push
cd ..
git add .

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
git push origin master
