#!/bin/bash

cd ~/.ssh
ssh-keygen -K
mv id_ed25519_sk_rk_git_dhnpx id_ed25519_sk
mv id_ed25519_sk_rk_git_dhnpx.pub id_ed25519_sk.pub
