# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

fpath+=~/.zfunc
compinit

setopt globdots
setopt globcomplete

export FZF_DEFAULT_COMMAND='fd -HI'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -HI -t d"

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# IME integration
export GTK_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

# display scale
export GDK_SCALE=1
export GDK_DPI_SCALE=1.5

#export QT_SCALE_FACTOR=2
#export QT_FONT_DPI=192


export ANDROID_HOME=/home/bczhc/bin/AndroidSdk

export PATH=/home/bczhc/bin/scripts/exec-override:"$PATH"
export PATH=/home/bczhc/bin:"$PATH"
export PATH=/home/bczhc/bin/scripts:"$PATH"
export PATH="$PATH":/home/bczhc/bin/AndroidSdk/platform-tools
export PATH="$PATH":/home/bczhc/code/rust/target/debug
export PATH="$PATH":/home/bczhc/open-source/zig-lsp
export PATH="$PATH":/home/bczhc/.local/share/gem/ruby/3.0.0/bin
export PATH="$PATH":/home/bczhc/.local/bin
export PATH="$PATH":/home/bczhc/go/bin
export PATH="$PATH":/usr/lib/emscripten

# proxy
hpp=16619
export http_proxy='http://localhost:'$hpp
export https_proxy="$http_proxy"
export no_proxy=localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16
export _JAVA_OPTIONS="-Dhttp.proxyHost=localhost -Dhttp.proxyPort=$hpp -Dhttps.proxyHost=localhost -Dhttps.proxyPort=$hpp"

# Rust
export RUSTUP_HOME=/home/bczhc/.rustup
export CARGO_HOME=/home/bczhc/.cargo
. "$HOME/.cargo/env"

export EDITOR=vim
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
# export DOCKER_PROXY_ENV="-e no_proxy=localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16 -e http_proxy=http://localhost:16616 -e https_proxy=http://localhost:16616"
# export DOCKER_PROXY_ENV_EXPORT='export no_proxy=localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16; export http_proxy=http://localhost:16616; export https_proxy=http://localhost:16616'

ddusr1loop() {
    while true; do sudo ddusr1; sleep 1; done
}

# aliases
alias history='omz_history -i'
alias abspath='readlink -f'

alias ls='ls --color=auto'
alias sl='ls'
alias LS='ls'
alias SL='ls'
alias ll='ls -lp'

alias grep='grep --color'

alias pacSyyu='non-proxy sudo pacman -Syyu'
alias pacS='non-proxy sudo pacman -S'

alias icat='kitty +kitten icat'

alias neofetchlc='neofetch | lolcat'

alias xc='xclip -selection clipboard'

alias np='non-proxy'

alias chmx='chmod +x'

alias neofetch='neofetch --sixel ~/.config/neofetch/archlinux-logo.png --size 30%'

alias rename='perl-rename'

alias gpgclearsign='gpg --clearsign --local-user 2A8D4543A87E66C75F8E53DC41355DA0B11F584F'

# history
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
unsetopt hist_ignore_dups

export DEEPIN_WINE_SCALE=2

export LC_ALL=C.UTF-8

# Firefox smooth touchpad scrolling
export MOZ_USE_XINPUT2=1

export PATH="$PATH:/home/bczhc/rust"

#PATH="/home/bczhc/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/bczhc/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/bczhc/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/bczhc/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/bczhc/perl5"; export PERL_MM_OPT;
