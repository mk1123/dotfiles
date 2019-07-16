# export ppaATH=$HOME/bin:/usr/local/bin:$PATH
#
#

# Path to your oh-my-zsh installation.
export ZSH="/Users/mkhattar/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
 #export PATH="/Users/mkhattar/.local/bin:$PATH"
# Set list of themes to load
 export PATH=//anaconda3/bin:$PATH
export PATH="$PATH:/Users/mkhattar/flutter/bin"
#export PATH=$PATH:/Users/mkhattar/Applications/SageMath
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  npm
  zsh-syntax-highlighting
  z
  react-native
  osx
)

source $ZSH/oh-my-zsh.sh
bindkey '\e' autosuggest-execute

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship
bindkey "^U" backward-kill-line
bindkey "^X^_" redo

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#alias vim 'vim --servername vim'

source "/Users/mkhattar/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
export TCLLIBPATH="/usr/local/lib"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

function jk() {
    git add .
    git commit -a -m "$1"
    git push origin master
}

function vc() {
    vim ~/.vimrc
}

function zc() {
    vim ~/.zshrc
}
#e (commented outxport FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --follow -g '!{.git,node_modules,Library,env,Movies,Pictures,Applications,Pods}'"
export FZF_COMPLETION_TRIGGER="*"
export FZF_DEFAULT_OPTS="--height=70% --preview='cat {}' --preview-window=right:60%:wrap"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="rg --hidden --files --null -g '!{.git,node_modules,Library,env,Movies,Pictures,Applications,Pods}' | xargs -0 gdirname | uniq"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
