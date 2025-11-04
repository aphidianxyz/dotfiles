#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='┌─{\[\e[92m\]\u\[\e[0m\]\[\e[38;5;208m\]@\[\e[0m\]\[\e[93m\]\H\[\e[0m\]}-{\[\e[92m\]\t\[\e[0m\]}\n└─[\[\e[92m\]\w\[\e[0m\] \[\e[38;5;208m\]|\[\e[92m\] $(git branch --show-current 2>/dev/null)\[\e[0m\]]\[\e[38;5;208m\]\$\[\e[0m\] '
export PROMPT_DIRTRIM=4

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# run ssh-agent automatically, make sure theres only 1 ssh-agent process at a time
if ! pgrep -u "$USER" ssh-agent >/dev/null; then
	ssh-agent -t 1h >"$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
	source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

fastfetch --config "$HOME/.config/fastfetch/fastfetch.jsonc" --logo "arch_small"
# set PROMPT_COMMAND
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

source /usr/share/nvm/init-nvm.sh

# Created by `pipx` on 2023-12-20 19:54:51
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"

# set terminal titles
update_terminal_title() {
    # Extract the last executed command from the history
    local last_command=$(history 1 | sed 's/^ *[0-9]* *//')
    # Set the terminal title to the last command and the current working directory
    echo -ne "\033]0;${last_command} - ${PWD}\007"
}

# Set PROMPT_COMMAND to call update_terminal_title before each prompt
PROMPT_COMMAND="update_terminal_title"
