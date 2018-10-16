#!/bin/bash

files=(utils/bitbucket_keys/gitrepo.pem priv.pem roles/deploy_app/templates/env.secret)

if [[ $1 = "decrypt" ]]; then
  for file in "${files[@]}"
  do
    ansible-vault --vault-password-file=.ansible_vault_pass \
      decrypt "$file.vaulted" \
      --output "$file"
    chown $USER:$USER $file
    chmod 0400 $file
  done
else
  for file in "${files[@]}"
  do
    ansible-vault --vault-password-file=.ansible_vault_pass \
      encrypt "$file" \
      --output "$file.vaulted"
  done
fi;
