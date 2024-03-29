#!/bin/bash

files=( \
  utils/bitbucket_keys/gitrepo.pem \
  priv.pem \
  roles/deploy_backend/templates/env.secret \
  inventory/group_vars/docker_registry.yml \
)

if [[ $1 = "decrypt" ]]; then
  for file in "${files[@]}"
  do
    ansible-vault --vault-password-file=.ansible_vault_pass \
      decrypt "$file.vaulted" \
      --output "$file"
    chown 1000:1000 $file
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
