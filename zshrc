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
# Load theme
antigen theme alanpeabody
# Tell antigen that you're done
antigen apply

#######################
## User configuration #
#######################
# Environmental vars
export EDITOR="vim"
# Add scripts
export PATH=~/.dotfiles/bin:${PATH}
######################
# Load local config  #
######################
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
