#!/bin/bash

source .gpgpass

echo $host_ssh

echo $passwords

gpg --passphrase $host_ssh --yes gitrepo.pem.gpg