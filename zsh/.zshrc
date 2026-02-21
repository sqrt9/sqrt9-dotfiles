# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.

# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH


#defaults write -g ApplePersistence -bool no
#sudo chown root ~/Library/Preferences/ByHost/com.apple.loginwindow*
#sudo chmod 000 ~/Library/Preferences/ByHost/com.apple.loginwindow*

#
#

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

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
plugins=(git)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
~/.p10k.zsh


export ASUP=/Users/hpt/Library/Application\ Support/
export WINEPREFIX=~/wineprefix64
export VK_ICD_FILENAMES=/opt/homebrew/share/vulkan/icd.d/MoltenVK_icd.json
export DXVK_HUD=1
export VULKAN_SDK=/opt/homebrew/opt/vulkan-sdk/lib/vulkan
export PATH=$VULKAN_SDK/bin:$PATH
export WINEDLLOVERRIDES="d3d11=n;dxgi=n"
export DYLD_LIBRARY_PATH=$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH
alias ls="eza -liahmUH --icons=never"
alias brewupdate='brew update && brew upgrade && brew upgrade --formula && brew upgrade --cask && brew cleanup'
alias xattr="/usr/bin/xattr"
alias emacsweb="ttyd --writable --port 7681 emacs -nw"
alias termweb="ttyd --writable --port 7682 zsh -i"



bold=$(tput bold && tput setaf 1)
normal=$(tput sgr0)
seed=$((RANDOM%13))
cseed=$RANDOM

if [ $seed -eq 0 ]; then
    l1=""
    l2="Swings a low sickle ark,"
    l3="From its perch in the dark"
elif [ $seed -eq 1 ]; then
    l1=""
    l2="Stay with me for awhile, oh,"
    l3="That’s an awfully real gun..."	
elif [ $seed -eq 2 ]; then
    l1="As I crash through the rafters,"
    l2="And the ropes and pulleys trail after"
    l3=""
elif [ $seed -eq 3 ]; then
    l1="Slow heart, brace and aim"
    l2="Smoke me out of my hiding place"
    l3="Long life, state your case"
elif [ $seed -eq 4 ]; then
    l1="Brandishing themselves"
    l2="Like a burning branch"
    l3=""
elif [ $seed -eq 5 ]; then
    l1="I feel; I see -- everything."
    l2="And I am in love with the hook"
    l3="Upon which everyone hangs"
elif [ $seed -eq 6 ]; then
    l1="Glare and gnaw"
    l2="Like the character god"
    l3="Bearing down upon the houses and lawns"
elif [ $seed -eq 7 ]; then
    l1="Tonight the birds are watching me"
    l2="Don't they have more important things to do?"
    l3=""
elif [ $seed -eq 8 ]; then
    l1="There's just no room"
    l2="For all our thoughts"
    l3=""
elif [ $seed -eq 9 ]; then
    l1="Hills steep off into whiteness,"
    l2="People or stars"
    l3=""
elif [ $seed -eq 10 ]; then
    l1="Until the day"
    l2="When he says 'rise',"
    l3="Only the flat iron would bubble up"
elif [ $seed -eq 11 ]; then
    l1=""
    l2="Hello?"
    l3=""
elif [ $seed -eq 12 ]; then
    l1="And so the dove of hope"
    l2="Began it's downward slope"
    l3=""
fi
 

alias cat="bat --paging=never"
alias code="code --reuse-window ."
alias rcr="source ~/.zshrc || yabai --service-restart || skhd --reload"
alias cdas="cd /Users/hpt/Library/Application\ Support/"
alias cds="cd /Users/hpt/scratch"
alias cdd="cd /Users/hpt/Desktop"
alias cddl="cd /Users/hpt/Downloads"
alias cddocs="cd /Users/hpt/docs"
alias cdbin="cd /usr/local/bin"
alias c="pbcopy"
alias p="pbpaste"
alias cdl="cd /Users/hpt/docs/writing/latex/"
alias py="python3"
alias qq="exit"
alias ec="emacsclient"
alias ecz="ec ~/.zshrc"
alias ecy="ec ~/.config/yabai/yabairc"
alias ecs="ec ~/.config/skhd/skhdrc"
alias gitc="git -commit -m"
alias gitf="git fetch"
alias gitm="git merge"
alias gitpom="git push origin main"
alias gitp="git pull"
alias gitco="git checkout"
alias ff="fzf -m"
alias ffd="cd . && cd \$(find . -type d \( -name node_modules -o -name .git \) -prune -o -name '*'  -type d -print | fzf)"
alias gitcl="git clone"
alias ss="source ~/.zshrc"
alias new="eza -snew -1 -f | tail -n 1"
export EDITOR="nano"
export BAT_THEME="ansi"
export FZF_DEFAULT_OPTS="--color=default"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


alias urls="echo 'Source	all	country	last
http://readallcomics.com	✓	✗	✓ was working
http://www.comicextra.com/	✓	✗	✓
http://www.mangatown.com/	✓	✗	✓
https://mangadex.org/           ✓	✓	✗
https://readcomiconline.li/	✓	✗	✓ not working last time i tried
https://www.mangareader.tv/	✓	✗	✓
https://www.mangakalot.com/	✓	✗	✓
https://www.manganato.com/      ✓	✗	✓
'"

git_c_remote_url () {
 usr=$(gh api user | jq -rc '.login')
 printf "repo name? : "
 read repo
 printf "user $usr \n"
 printf "repo $repo \n"
 url=$(gh repo view $usr/$repo --json sshUrl | jq -rc '.sshUrl' | tr -d "\n")
 echo $url | c #pbcopy
 printf $url
}

git_make_repo ()
{
    echo "make a gh repo for the url -- gh repo create name"
    echo "make the main branch       -- git init -b main"
    echo "add local files            -- git add ."
    echo "commit them                -- git commit -m 'First commit'"
    echo "get the ssh url            -- git_c_remote_url"
    echo "add the origin             -- git remote add origin (url)"
    echo "set the upstream           -- git remote add upstream <url>"
    echo "(optional) git remote -v (verbose) to see where ur pushing and pulling"
    echo "git push --set-upstream origin main"
    echo "done!"
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.


alias nnn='/opt/homebrew/bin/nnn -de' #-d for details and -e to open files in $VISUAL (for other options, see 'man nnn'...)
#-----
export NNN_OPTS="H" # 'H' shows the hidden files. Same as option -H (so 'nnn -deH')
#export NNN_OPTS="deH" # if you prefer to have all the options at the same place
export LC_COLLATE="C" # hidden files on top
export NNN_FIFO="/tmp/nnn.fifo" # temporary buffer for the previews
export NNN_FCOLORS="131bdc540059ddf760d6abc4" # feel free to change the colors
export NNN_PLUG='p:preview-tui' # many other plugins are available here: https://github.com/jarun/nnn/tree/master/plugins
#-----
nn () # to cd on quit
{
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    nnn "$@"
    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}



NNN_PLUG='1:ipinfo;p:preview-tui'


export PATH="/opt/homebrew/opt/openal-soft/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$PATH:/Users/hpt/.spicetify
if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
fi
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/hpt/.opam/opam-init/init.zsh' ]] || source '/Users/hpt/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=0"

# Source - https://stackoverflow.com/a
# Posted by Selmison Miranda
# Retrieved 2025-11-27, License - CC BY-SA 4.0



# if [[ -z "$TMUX" ]]; then

#     exec tmux new-session -A -s main
# fi

clear
logo() {
if [ "$COLUMNS" -ge 85 ]; then
    echo "|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|"
    echo "|＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|"
    echo "|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|"
    echo "|＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|"
    echo "|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|   $bold $l1 $normal"
    echo "|＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿ |     $bold $l2 $normal"
    echo "|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿ |   $bold $l3 $normal"
    echo "|＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿¯ ¯|"
    echo "|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿¯|"
    echo "|＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿＿＿|＿¯ |"
    echo
    last -1 | awk "{print \$1, "on", \$2}"
else
    echo
    echo
    echo "$bold $l1 $normal"
    echo "$bold $l2 $normal"
    echo "$bold $l3 $normal"
    echo
    last -1 | awk "{print \$1, "on", \$2}"
fi
    }

logo2(){
if [ "$COLUMNS" -ge 85 ]; then
    fastfetch
else
    echo $PWD
    last -1 | awk "{print \$1, "on", \$2}"
fi
}


logo3() {
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⡾⠿⠛⠛⠛⠻⠷⣶⣄⡀⠀⠀⠀⠀⠀⠀⢀⡀⡀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⢀⣼⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠙⣷⣄⠀⢀⣤⣶⠿⠟⠛⠻⠿⢷⣦⣀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⣼⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣤⣾⠏⠁⠀⠀⠀⠀⠀⠀⠈⠻⣷⡄⠀"
echo "⠀⠀⠀⠀⠀⢠⣿⠇⠀⠀⠀⠀⠀⠀⢀⣴⣶⣦⣄⠀⣿⣿⠏⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠹⣷⠀"
echo "⠀⠀⠀⠀⠀⠀⣿⡂⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⠀⣿⡟⠀⣴⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⣿⡇"
echo "⠀⠀⠀⠀⠀⠀⢿⣇⠀⠀⠀⠀⠀⠀⠈⠻⠿⠿⠋⣰⣿⡇⠀⠻⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⣿⡇"
echo "⠀⠀⠀⠀⠀⣠⣾⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⣠⣴⡿⠻⣧⡀⠀⠈⠉⠁⠀⠀⠀⠀⠀⠀⣸⣿⠀"
echo "⠀⠀⠀⠀⣼⡿⠋⠀⠙⠿⣷⣦⣤⣤⣴⣶⡿⠟⠉⠀⠀⠹⣷⣄⣀⠀⠀⠀⠀⠀⢀⣠⣶⣿⡅⠀"
echo "⠀⠀⠀⣼⣿⢃⡔⠁⢄⡈⢳⡄⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠿⠿⠷⠿⠿⠟⠋⠁⠹⣿⡀"
echo "⠀⠀⠀⣿⣿⠸⡄⢁⠂⡐⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠛⡉⠙⢦⡀⢹⣧"
echo "⠀⠀⠀⢻⣿⠀⠹⠤⠂⠀⠚⢁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡅⠂⠄⡡⢈⡇⢸⣿"
echo "⠀⠀⠀⠸⣿⡄⠀⠀⠀⠀⠀⢾⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠐⠠⣁⡼⠃⢸⣿"
echo "⠀⠀⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠙⢿⣦⣄⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⠗⠀⠈⠁⠉⠀⣠⣿⠏"
echo "⠀⣾⡿⠇⠀⠉⠙⠻⢿⣶⣤⣄⣀⠀⠈⠻⢷⣤⡀⢀⣠⣶⣿⠿⠛⠉⠀⠀⠀⠀⠀⣠⣴⣿⠏⠀"
echo "⣾⡿⠃⠀⠀⠀⠀⢀⣴⣿⡿⡿⣿⢿⣿⣿⣾⣿⣿⣿⣿⣿⣶⣴⣦⣶⣶⣶⣶⣾⣿⠿⠋⠁⠀⠀"
echo "⠘⠻⣷⣤⣀⠀⢀⣾⣿⢯⢷⡻⣼⢏⣾⣿⣿⣯⣿⣽⣿⣿⣻⣽⣻⢻⣿⣟⠛⠛⠻⠷⣶⣦⡀⠀"
echo "⠀⢀⣠⣿⣿⣿⣿⠿⣿⣯⣾⡿⢿⣯⣿⣟⣾⣽⣿⣟⣾⣿⣳⡞⣽⣏⡾⢿⣧⠀⠀⠀⢀⣼⣿⠀"
echo "⠀⣸⣿⠁⠈⠙⠉⠀⠈⠙⠋⠀⢸⣿⣞⡿⡽⣞⣧⢟⣟⡷⣻⣼⢳⡾⡽⢯⣿⣆⠀⣀⣽⡏⠁⠀"
echo "⠀⠸⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣾⣱⣟⡾⣜⢯⢾⣱⢷⣺⢻⣼⣛⡿⣼⣿⣾⡟⠛⠁⠀⠀"
echo "⠀⠀⠻⣧⡀⠀⠀⠀⠀⠀⢀⣴⣿⠿⠿⠿⢿⣷⣿⣾⣾⣿⣾⣿⣾⣭⣿⣵⣿⣿⡏⠁⠀⠀⠀⠀"
echo "⠀⠀⠀⠙⠻⢶⣶⣶⣶⣶⠿⠛⠁⠀⠀⠀⠰⣿⠁⠀⢀⣩⣈⠉⠉⠉⣉⠉⠉⠙⢷⡀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣶⣾⠿⠛⠻⣧⣴⣾⠟⠻⢶⣶⡿⠃⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
last -1 | awk "{print \$1, "on", \$2}"
echo
echo
}

#logo
#logo2
#logo3
#silly=1

last -3
if [[ $(lsof -i :7681) ]]; then
    printf 'emacs daemon running @ \e]8;;http://localhost:7681\e\\http://localhost:7681\e]8;;\e\\\n'
else
    printf 'starting emacs on ttyd'
    emacsweb &! 2>/dev/null #bg, disown and silence
    printf 'emacs started @ \e]8;;http://localhost:7681\e\\http://localhost:7681\e]8;;\e\\\n'
fi

if [[ $(lsof -i :7682) ]]; then
    printf 'connect to this terminal @ \e]8;;http://localhost:7682\e\\http://localhost:7682\e]8;;\e\\\n'
else
    termweb &! 2>/dev/null 
    printf 'zsh started @ @ \e]8;;http://localhost:7682\e\\http://localhost:7682\e]8;;\e\\\n'
fi

if [ "$silly" -ge 1 ]; then
echo " | |__   __ _| |_ _ __ ___   __ _ _ __  "
echo " | |_ \ / _| | __| |_ | _ \ / _| | |_ \ "
echo " | |_) | (_| | |_| | | | | | (_| | | | |"
echo " |_.__/ \__,_|\__|_| |_| |_|\__,_|_| |_|"
echo "          i am batman -batman (picture below, hes batm,an)"

echo "          |>_|>          ______________________________________________________________________________________   "
echo "          | e_e|      --<  Batman says:   There is nothing frenzied about debauchery. It is but a long sleep. |" 
echo "          | | |]         _____________________________________________________________________________________   "
echo "     ____| |-\___"
echo "    /.----.___.-->"
echo "  //   .-. (~v~) /|"
echo " | |  />:  .--  / >"
echo "// |-/  >_>____/\>~|"
echo "|/  \ |  []_|_|_] \ |"
echo "| \  | \ |___   _\ ]_}"
echo "| |  <-> /    .   | "
echo "| |     |   / |:  />"
echo "| |    |  /  /  |    |"
echo "\ |    |/\|  |/|/|    |"
echo "\|\ |\|  |  | / /\/\_-"
echo "   / |   |____)"
echo  "     |_/"
fi

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



vterm_printf() {
    if [ -n "$TMUX" ] \
        && { [ "${TERM%%-*}" = "tmux" ] \
            || [ "${TERM%%-*}" = "screen" ]; }; then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

# Added by zshellcheck installer
fpath+=(/Users/hpt/.local/share/zsh/site-functions)
export FZF_DEFAULT_COMMAND='fd'
