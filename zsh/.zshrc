# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# zhs的主题
ZSH_THEME="ys"
# Set list of themes to load
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
DISABLE_AUTO_UPDATE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# z命令快速跳转目录     x命令解压一切文件         命令行可以直接google
export ZSH_CUSTOM=$ZSH/custom
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi
if [ ! -f "$ZSH_CUSTOM/plugins/incr/incr.zsh" ]; then
  mkdir -p $ZSH_CUSTOM/plugins/incr/
  wget https://mimosa-pudica.net/src/incr.zsh -P $ZSH_CUSTOM/plugins/incr/
  #自动补全插件
  source $ZSH_CUSTOM/plugins/incr/incr.zsh
fi
if [ ! -f "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  mkdir -p $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
  source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [ ! -d "$ZSH_CUSTOM/plugins/git-open" ]; then
  mkdir -p $ZSH_CUSTOM/plugins/git-open
  git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
fi
plugins=(
  git
  z
  zsh-autosuggestions
  extract
  web-search
  zsh-syntax-highlighting
  gitignore
  git-open
  emoji
)

source $ZSH/oh-my-zsh.sh

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
#

# 自动更新的时间间隔，单位是天，这里设置 30 天更新一次
export UPDATE_ZSH_DAYS=30

# custom
# 自定义脚本
source ~/work/.workrc

# 环境变量
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_291.jdk/Contents/Home
export JAVA_HOME=/Users/passer/software/jdk11
export PATH=$JAVA_HOME/bin:$PATH
export PATH=~/conda/bin:$PATH
export PATH=~/work/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/software/sbt/bin:$PATH
export PATH=~/nodejs/npm/bin:$PATH
export PATH=/Applications/IntelliJ\ IDEA.app/Contents/plugins/maven/lib/maven3/bin:$PATH
export PATH="/opt/homebrew/opt/libtool/libexec/gnubin:$PATH"
export SBT_OPTS="-Dsbt.override.build.repos=true"
# https://www.cnblogs.com/StivenYang/p/12546605.html
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

# IDE 
export PATH=/Applications/GoLand.app/Contents/MacOS:$PATH
export PATH="/Applications/IntelliJ IDEA.app/Contents/MacOS":$PATH
export PATH=/Applications/PyCharm.app/Contents/MacOS:$PATH

# 别名
alias py='python'
alias history='fc -il 1'
alias sa='source ~/conda/bin/activate'
alias git-user='git config user.name "passer" && git config user.email "whzhoua@gmail.com"'
alias pip=pip3
alias gp='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias bm=bytebm
alias jwt='cloud-jwt --copy'
alias gm='git commit -am '
alias gpu='git push u $(git rev-parse --abbrev-ref HEAD)'
alias gcam='git commit -am '
alias gc='git checkout '
alias gcb='git checkout -b '

#sa python3.6.7

