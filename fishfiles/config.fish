if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/go/bin
fish_add_path ~/.local/share/pipx/venvs/ansible/bin

# Plugins
fundle plugin "edc/bass"
fundle plugin "FabioAntunes/fish-nvm"
fundle plugin "pure-fish/pure"

fundle init

# Remove the default Fish greeting
set fish_greeting

# Prompt configuration
set --universal pure_enable_single_line_prompt true
set --universal pure_color_git_branch green

set --universal EDITOR kak

function ls --wraps=ls --description 'List contents of directory with hiperlinks'
    command ls --hyperlink=auto $argv
end

function ll --wraps=ls --description 'List contents of directory using long format with hyperlinks'
    command ls -lh --hyperlink=auto $argv
end

# Aliases
alias gr="grep -rn"
alias e="kak"
alias p="plan"
alias play="mplayer -subcp cp1250"

# Git aliases
alias g="git"
alias grc="git add .; and git rebase --continue"
alias grm="git rebase -i master"

# Ruby on Rails aliases
alias b="bundle"
alias be="bundle exec"

# SSH Agent
if set -q SSH_CONNECTION; and not ssh-add -l > /dev/null
    ssh-add
end

# Rbenv
status --is-interactive; and ~/.rbenv/bin/rbenv init - fish | source
