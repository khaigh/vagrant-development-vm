# @khaigh (adapted from @crosbymichael)

# ---------Environment Variables-------- #
set -x DOCKER_HOST unix:///var/run/docker.sock
set -x EDITOR vim
set -x GOROOT /usr/local/go
set -x GOPATH $HOME/go

# ---------------Path------------------- #
set PATH $GOPATH/bin $PATH;
set PATH $HOME/local/bin $PATH;
set PATH $GOROOT/bin $PATH;
set PATH /usr/sbin $PATH;
set PATH $HOME $PATH;

# --------------Aliases----------------- #
alias lsa='ls -lah --color=auto'
alias ls='ls -lh --color=auto'
alias iptbleshow='iptables -L -n -t nat'

alias gs='git status -u'
alias gmt='git mergetool'
alias gc='git commit'
alias gca='git commit -a'
alias gb='git branch -v -v'
alias gaa='git add .'
alias gco='git checkout'
alias glg='git log --graph --stat --oneline --decorate'
alias gl='git log --graph --oneline --decorate'
alias gm='git merge --no-ff'
alias gtk='gitk'
alias gcl='git clone'
alias gpo='git push origin'
alias gp='git push'
alias gd='git diff'
alias gsl='git stash list'
alias gsa='git stash apply'
alias gpull='git pull'
alias gpullo='git pull origin'
alias gremotes='git remote -v'
alias gcount='git count-objects -H'
alias addlast='git commit --amend –C HEAD'
alias gcount='git fetch --all'
alias resetmaster='git fetch origin; and git reset --hard origin/master'
alias gls='git stash list'

alias ztar='tar -zcvf'
alias uztar='tar -zxvf'
alias lstar='tar -ztvf'
alias 7za='7z a'
alias cd..='cd ..'
alias cl='clear'
alias md='mkdir'
alias rd='rmdir'
alias back='popd'

alias encrypt='openssl aes-256-cbc -a -salt '
alias decrypt='openssl aes-256-cbc -d -a '

alias godebug='go build -gcflags "-N -l"'
alias godocserver='godoc -http=:8111'
alias buildall='go build -v . ./...'
alias installall='go install . ./...'
alias gobi='go build -v . ./...; and go install . ./...'
alias attach='tmux attach-session -t 0'
alias tree='tree -F'

# http://ethanschoonover.com/solarized#the-values
set -l base03  "--bold black"
set -l base02  "black"
set -l base01  "--bold green"
set -l base00  "--bold yellow"
set -l base0   "--bold blue"
set -l base1   "--bold cyan"
set -l base2   "white"
set -l base3   "--bold white"
set -l yellow  "yellow"
set -l orange  "--bold red"
set -l red     "red"
set -l magenta "magenta"
set -l violet  "--bold magenta"
set -l blue    "blue"
set -l cyan    "cyan"
set -l green   "green"

# Used by fish's completion; see
# http://fishshell.com/docs/2.0/index.html#variables-color
set -g fish_color_normal      $base0
set -g fish_color_command     $base0
set -g fish_color_quote       $cyan
set -g fish_color_redirection $base0
set -g fish_color_end         $base0
set -g fish_color_error       $red
set -g fish_color_param       $blue
set -g fish_color_comment     $base01
set -g fish_color_match       $cyan
set -g fish_color_search_match "--background=$base02"
set -g fish_color_operator    $orange
set -g fish_color_escape      $cyan

# Used by fish_prompt
set -g fish_color_hostname    $cyan
set -g fish_color_cwd         $yellow
set -g fish_color_git         $green
set -g fish_color_dirty       $yellow

# --------------Functions----------------- #
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l cyan (set_color "cyan")
  set -l yellow (set_color "yellow")
  set -l red (set_color -o "red")
  set -l blue (set_color "blue")
  set -l green (set_color "green")
  set -l normal (set_color -o "blue")

  set -l cwd $cyan(prompt_pwd)

  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)
    set git_info "$green$git_branch "

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow✗"
      set git_info "$git_info$dirty"
    end
  end

  printf '%s%s|%s%s> %s' $cwd $red $git_info $normal $normal
end
