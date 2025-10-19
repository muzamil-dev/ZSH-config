# ==============================================================
# ~/.zshrc — macOS + Starship + Bun + Autosuggestions + Neofetch
# ==============================================================

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
eval "$(starship init zsh)"
