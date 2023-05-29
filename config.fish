alias md='mkdir -p'
alias b='bat'
alias ls='ls -h --color'
alias m='make'
alias p='python3.9'
alias brewamd='arch -x86_64 /usr/local/bin/brew'
alias blg='brew link go'
alias bug='brew unlink go'
alias v='vise'
alias vim='vise'
alias e='emacs -nw'
alias d='docker'
alias t='thock'
alias zb='zig build'
alias ccc='rm -r .*.~undo-tree~'

alias k='kubectl'

# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

#git
alias g='git'

alias ga='git add'
alias gaa='git add --all'

alias gb='git branch'
alias gbd='git branch -D'

alias gcl='git clone --recurse-submodules'
alias gcmsg='git commit -m'
alias gco='git checkout'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gcn!='git commit -v --no-edit --amend'

alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch'
alias gl='git pull'
alias glod='git pull origin develop'
alias glom='git pull origin master'
alias gll='git log'
alias glo='git log --oneline --decorate'
alias gp='git push'
alias gpo='git push origin'

alias gre='git reset'
alias grs='git restore'
# alias grse='git reset $1 && git restore $1'

alias grb='git rebase'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'

alias gm='git merge'
alias gmc='git merge --continue'
alias gma='git merge --abort'

alias gss='git status -s'
alias gsta='git stash push'
alias gstaa='git stash apply'

alias gsw='git switch'
alias gswc='git switch -c'

# podman
alias pmi='podman machine init'
alias pmu='podman machine start'
alias pmd='podman machine stop'
alias pml='podman machine list'

alias pcl='podman container ls -a'
alias pil='podman image ls -a'
alias psp='podman system prune'

if status is-interactive
    eval '/opt/homebrew/bin/brew shellenv' > /dev/null
    fish_add_path -a /opt/homebrew/bin
    fish_add_path -a /Users/iorvd/go/bin
    fish_add_path -a /Users/iorvd/bin
    fish_add_path -a /Users/iorvd/bin/google-cloud-sdk/bin
    # Commands to run in interactive sessions can go here
    export GOPRIVATE="github.com"

    function fish_prompt
        set_color $fish_color_cwd
        set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')

        if [ "$HOME" = (pwd) ]
            printf "∂"
        else
            printf (basename (pwd))
            set_color FFFFFF
            printf '('
            set_color FF0000
            printf "$git_branch"
            set_color FFFFFF
            printf ')'
            set_color $fish_color_cwd
        end
        printf " "
    end

    function fish_right_prompt
        set -l last_status $status
        set_color $fish_color_cwd
        printf $last_status
    end
end
export GPG_TTY=/dev/ttys000
