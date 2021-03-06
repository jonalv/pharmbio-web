#!/bin/bash
echo "Please provide a commit message (without \"\"s) for the update to the public website repo, followed by [ENTER]:"
read commitmsg
git commit -am "$commitmsg"
git pull; git push;
if [[ ! -d public ]]; then
    git clone git@github.com:pharmbio/pharmbio.github.io.git public
fi;
cd public && git pull && cd .. && hugo && cd public && git add * && git commit -am "$commitmsg" && git push && cd ..;
