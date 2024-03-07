#!/bin/zsh

export AUTO_NTFY_DONE_IGNORE="vim screen tmux meld ssh sshq"
eval "$(ntfy shell-integration --foreground-too --longer-than 60)"
