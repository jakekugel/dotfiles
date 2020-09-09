install:
	ln -sfn ".dotfiles/bash/.bash_profile" ${HOME}
	ln -sfn ".dotfiles/bash/.bashrc" ${HOME}
	ln -sfn ".dotfiles/bash/.git-completion.bash" ${HOME}
	ln -sfn ".dotfiles/bash/.curl-format" ${HOME}
	ln -sfn ".dotfiles/vim/.vimrc" ${HOME}
	ln -sfn ".dotfiles/zsh/.zshrc" ${HOME}
	ln -sfn ".dotfiles/zsh/.hushlogin" ${HOME}
	mkdir -p ${HOME}/.ssh
	chmod 700 ${HOME}/.ssh
	ln -sfn "../.dotfiles/ssh/config" ${HOME}/.ssh
	chmod 644 ${HOME}/.ssh/config

ssh:
	chmod 600 ${HOME}/.ssh/config

pull: ssh
	git pull

.PHONY: ssh pull install
