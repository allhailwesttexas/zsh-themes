# burger2.zsh-theme
# by Peter (https://github.com/allhailwesttexas)
# Based on af-magic: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
# but with more burgers!
# Additional inspiration from: http://notes.torrez.org/2013/04/put-a-burger-in-your-shell.html
# Additional additional inspiration from: http://blog.pluralsight.com/my-command-line-prompt

autoload -U colors && colors
autoload -U add-zsh-hook
setopt prompt_subst
setopt promptpercent

export VIRTUAL_ENV_DISABLE_PROMPT=yes

function virtenv_indicator {
    if [[ -z $VIRTUAL_ENV ]] then
        psvar[1]=''
    else
        psvar[1]=${VIRTUAL_ENV##*/}
    fi
}

add-zsh-hook precmd virtenv_indicator

eval my_gray='$FG[237]'
eval my_orange='$FG[214]'
eval my_color='$FG[032]'

# Save a smiley to a local variable if the last command exited with success.
# IF ERROR FLIP TABLE
local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}╯°□°╯︵ ┻━┻%{$reset_color%})"

# primary prompt
PROMPT='
%{$my_color%}%~%{$reset_color%}
${smiley} %{$reset_color%}$(git_prompt_info) \
🍔  '

# right prompt
RPROMPT=%{$my_orange%}%(1V.(%1v).)%{$reset_color%}

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
