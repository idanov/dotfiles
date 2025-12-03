#################
# Antigen setup #
#################
# Load antigen
source $HOME/.dotfiles/antigen/antigen.zsh
# Load robbyrussell's oh-my-zsh's library
antigen use oh-my-zsh
# Plugins from robbyrussell's oh-my-zsh
antigen bundle git
antigen bundle git-hubflow
antigen bundle docker
antigen bundle history-substring-search
antigen bundle web-search
# Github plugins
antigen bundle rupa/z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
# Load theme
antigen theme romkatv/powerlevel10k
# Tell antigen that you're done
antigen apply

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#######################
## User configuration #
#######################
setopt histignorespace
setopt share_history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTORY_IGNORE="(ls|cd|pwd|exit)*"
# Environmental vars
export EDITOR="vim"
export VISUAL="nvim"
export BAT_THEME="TwoDark"
# Add scripts
export PATH=~/.dotfiles/bin:${PATH}
# Activate mise and autoload .env files
export MISE_ENV_FILE=.env
command -v mise >/dev/null 2>&1 && eval "$(mise activate zsh)"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# GPG in emacs
export GPG_TTY=$(tty)

# Show cert validity
function seecert () {
  nslookup $1
  (openssl s_client -showcerts -servername $1 -connect $1:443 <<< "Q" | openssl x509 -text | grep -iA2 "Validity")
}

# Add useful aliases
alias k='kubectl'
magit() {
 emacsclient -c -a "" -F '(quote (name . "magit") (width . 100) (height . 40) (minibuffer . t) (left . 632) (top . 252) (user-position . t) (menu-bar-lines . 0))' -e '(progn (magit-status) (delete-other-windows) (x-focus-frame nil))'
}

######################
# Load local config  #
######################
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
    export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable iterm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Cross-platform open command
[[ "$OSTYPE" == "linux-gnu"* ]] && ! command -v open &> /dev/null && alias open='xdg-open'

# The following lines have been added to increase completions
fpath+=(~/.zsh/completions)
autoload -Uz compinit && compinit
