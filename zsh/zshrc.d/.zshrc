# vim:ft=zsh:

##############################################################
# Profiling.
##############################################################

# uncomment to profile & run `zprof`
# zmodload zsh/zprof

##############################################################
# zPlug.
##############################################################

if [[ ! -f ${HOME}/.zplug/init.zsh ]]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

source ${HOME}/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"

NVM_NO_USE=true
zplug "lukechilds/zsh-nvm"
zplug "ahmedelgabri/pure", depth:1, use:"{async,pure}.zsh", as:theme
zplug "rupa/z", use:"z.sh"
zplug "changyuheng/zsh-interactive-cd"
zplug "lukechilds/zsh-better-npm-completion"
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
# bind UP and DOWN keys
bindkey "${terminfo[kcuu1]}" history-substring-search-up
bindkey "${terminfo[kcud1]}" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Must be the last?
zplug "zsh-users/zsh-completions"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# zplug load --verbose
zplug load

ZSH_AUTOSUGGEST_USE_ASYNC=true
TIPZ_TEXT='Alias tip:'

##############################################################
# CONFIG.
##############################################################

source ${HOME}/.dotfiles/zsh/zshrc.d/aliases.zsh
for func (${HOME}/.dotfiles/zsh/zshrc.d/functions/*.zsh) source $func

##############################################################
# TOOLS.
##############################################################

(( $+commands[grc] )) && source "${HOMEBREW_ROOT:-/usr/local}/etc/grc.bashrc"
[ -f ${HOME}/.fzf.zsh ] && source ${HOME}/.fzf.zsh

##############################################################
# direnv.
##############################################################

if [ $(command -v direnv) ]; then
  export NODE_VERSIONS="${HOME}/.nvm/versions/node"
  export NODE_VERSION_PREFIX="v"

  eval "$(direnv hook zsh)"
fi

##############################################################
# /etc/motd
##############################################################

if [ -e /etc/motd ]; then
  if ! cmp -s ${HOME}/.hushlogin /etc/motd; then
    tee ${HOME}/.hushlogin < /etc/motd
  fi
fi

##############################################################
# Custom completions init.
##############################################################

[ -f ${ZDOTDIR:-${HOME}}/custom_completions_init.zsh ] && source ${ZDOTDIR:-${HOME}}/custom_completions_init.zsh

##############################################################
# LOCAL.
##############################################################

if [ -f ${HOME}/.zshrc.local ]; then
  source ${HOME}/.zshrc.local
else
  if [[ -z "${HOMEBREW_GITHUB_API_TOKEN}" && -z "${GITHUB_TOKEN}" && -z "${GITHUB_USER}" ]]; then
    echo "These ENV vars are not set: HOMEBREW_GITHUB_API_TOKEN, GITHUB_TOKEN & GITHUB_USER. Add them to ~/.zshrc.local"
  fi
fi

