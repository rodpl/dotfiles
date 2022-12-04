echo 'Running ~/.zshrc'
    
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set Variables
# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Create Aliases
alias ls='exa -laFh --git'
alias exa='exa -laFh --git'


# Customize Prompt(s)
PROMPT='
%1~ %L %# '

RPROMPT='%*'

# Write Handy Functions
function mkcd() {
    mkdir -p "$@" && cd "$_";
}

echo 'Finished ~/.zshrc'
