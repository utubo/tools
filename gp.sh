#!/bin/bash

p=()
for OPT in "$@"
do
	if [[ $OPT =~ ^[^-] ]]; then
		p+=($OPT)
	fi
done

if [[ ${#p[*]} -gt 0 ]]; then
	remote=${p[0]}
else
	remote=`git remote`
fi
if [[ ${#p[*]} -gt 1 ]]; then
	branch=${p[1]}
else
	branch=`git symbolic-ref --short HEAD`
fi

git log --name-status --oneline $remote/$branch..$branch
git push $@

