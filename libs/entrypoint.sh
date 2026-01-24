#!/bin/sh
# docker run --rm -it -v $PWD:/home/user/rustdesk-server \
# -v rustdesk-server-git-cache:/home/user/.cargo/git \
# -v rustdesk-server-registry-cache:/home/user/.cargo/registry \
# --user $(id -u):$(id -g) --entrypoint bash rustdesk-server-builder:2026-01-24-00-trixie

cd "$HOME"/rustdesk-server || exit 1
. "$HOME"/.cargo/env

sudo chown -R user:user /home/user/.cargo/git
sudo chown -R user:user /home/user/.cargo/registry

set -f
cargo clean
cargo build --release
