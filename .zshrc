# ==============================================================
# ~/.zshrc — macOS + Powerlevel10k + Bun + Autosuggestions + Neofetch
# ==============================================================

# --- Disable Powerlevel10k warning output ---
# (silences the instant prompt console warning)
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# --- Powerlevel10k instant prompt (keep at top) ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Load Powerlevel10k ---
source ~/powerlevel10k/powerlevel10k.zsh-theme

# --- Load Powerlevel10k configuration ---
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- Plugins and environment setup ---
# zsh-autosuggestions
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Bun setup
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# --- Run neofetch once when the shell is fully loaded ---
autoload -U add-zsh-hook
neofetch_once() {
  if [[ -z $NEOFETCH_RAN ]]; then
    neofetch
    export NEOFETCH_RAN=1
  fi
}
add-zsh-hook -Uz precmd neofetch_once
