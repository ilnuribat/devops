#!/bin/bash

files=(gitrepo.pem priv.pem roles/deploy_app/templates/env.secret)

if [[ $1 = "decrypt" ]]; then
  for file in "${files[@]}"
  do
    ansible-vault --vault-password-file=.ansible_vault_pass decrypt "$file"
  done
else
  for file in "${files[@]}"
  do
    ansible-vault --vault-password-file=.ansible_vault_pass encrypt "$file"
  done
fi;




# ansible-vault --vault-password-file=.ansible_vault_pass \
#   encrypt \
#   gitrepo.pem \
#   priv.pem \
#   inventory/group_vars/*
