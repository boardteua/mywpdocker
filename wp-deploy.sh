#!/bin/bash
ssh_="$1"
key_path="~/.ssh/$2"
git_=$(git config --get remote.origin.url)
rname=$(basename `git rev-parse --show-toplevel`)

echo 'no "-o IdentitiesOnly=yes"'
echo $git_
echo $rname

ssh -i ${key_path} ${ssh_} "git -c 'core.sshCommand=ssh -i ~/.ssh/git' clone ${git_}"

scp -i ${key_path} .env ${ssh_}:~/${rname}/.env
ssh -i ${key_path} ${ssh_} "export RNAME=${rname}; bash ${rname}/bin/deploy-wp.sh"
