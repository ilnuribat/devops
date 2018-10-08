#!/bin/bash

files=(gitrepo.pem priv.pem roles/deploy_app/templates/env.secret)

if [[ $1 = "decrypt" ]]; then
  for file in "${files[@]}"
  do
    ansible-vault --vault-password-file=.ansible_vault_pass \
      decrypt "$file.vaulted" \
      --output "$file"
  done
else
  for file in "${files[@]}"
  do
    ansible-vault --vault-password-file=.ansible_vault_pass \
      encrypt "$file" \
      --output "$file.vaulted"
  done
fi;
