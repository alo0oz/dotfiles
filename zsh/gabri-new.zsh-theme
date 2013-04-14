##############################################################
# Setting the tab titles to the current directory
##############################################################

function precmd () {
  tab_label=${PWD/${HOME}/\~} # use 'relative' path
  echo -ne "\e]2;${tab_label}\a" # set window title to full string
  echo -ne "\e]1;${tab_label: -24}\a" # set tab title to rightmost 24 characters
}

##############################################################
# Showing Git branch name & status.
##############################################################

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

##############################################################
# Show Ruby "RVM" version.
##############################################################

function rvm_info(){
    if [[ -s ~/.rvm/scripts/rvm ]] ; then
      echo "$FG[210]`~/.rvm/bin/rvm-prompt v`%{$reset_color%} $EPS1"
    else
      if which rbenv &> /dev/null; then
        echo "$FG[210]`rbenv version | sed -e "s/ (set.*$//"`%{$reset_color%} $EPS1"
      else
        echo "$EPS1"
      fi
    fi
}

##############################################################
# PROMPT Colors & config.
##############################################################

PROMPT='$FG[104]%n@%m: $FG[096]%~
$FG[180]⚽ %{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[239] • "
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[160]+ "
ZSH_THEME_GIT_PROMPT_CLEAN="$FG[010]"

RPROMPT='$(git_prompt_info)$(rvm_info)'


