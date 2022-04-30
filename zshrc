export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git vi-mode extract zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export WSL_HOST=$(sed -rn 's/nameserver\ (.+?)$/\1/p' /etc/resolv.conf)
export VPN_PROTOCOL=http
export VPN_PORT=7890


set_proxy(){
	export all_proxy=$VPN_PROTOCOL://$WSL_HOST:$VPN_PORT
	export http_proxy=$VPN_PROTOCOL://$WSL_HOST:$VPN_PORT
	export https_proxy=$VPN_PROTOCOL://$WSL_HOST:$VPN_PORT
}

unset_proxy(){
	unset all_proxy
	unset http_proxy
	unset https_proxy
}

set_proxy
#export PROJECT_PATH=$(dirname $(ls -ld .zshrc | awk '{print $NF}'))
#source $PROJECT_PATH/zshrc-private
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
alias sho="ssh.exe oneflow21 tmux a || tmux"
