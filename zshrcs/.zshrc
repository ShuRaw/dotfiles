# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#3a5072,bg=#8abcd9,bold,underline"

plugins=(docker copyfile ansible python pip npm last-working-dir docker-compose git archlinux z vi-mode web-search zsh-syntax-highlighting zsh-autosuggestions vscode tmux tmuxinator zsh-fzf-history-search poetry fzf)

source $ZSH/oh-my-zsh.sh
source ~/dotfiles/sybox-config/.init

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


eval "$(rbenv init -)"

# Created by `pipx` on 2024-02-21 10:10:26
export PATH="$PATH:/Users/shubhamrawat/.local/bin"

# Task Master aliases added on 11/27/2025
alias tm='task-master'
alias taskmaster='task-master'

# Added by Antigravity
export PATH="/Users/shubhamrawat/.antigravity/antigravity/bin:$PATH"
