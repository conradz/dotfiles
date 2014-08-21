DEST := $(HOME)
.PHONY: install bash vim awesome

install: bash vim awesome

bash:
	rm $(DEST)/.bashrc $(DEST)/.bash_profile
	ln -s $(realpath bash/rc) $(DEST)/.bashrc
	ln -s $(realpath bash/profile) $(DEST)/.bash_profile

vim: vim_link vundle
vim_link:
	# remove existing vim configuration
	rm -rf $(DEST)/.vim $(DEST)/.vimrc
	# create links for vim configuration
	ln -s $(realpath vim) $(DEST)/.vim
	ln -s $(realpath vim/rc) $(DEST)/.vimrc
vundle:
	# Create the bundle folder if it doesn't exist
	mkdir -p vim/bundle
	# Checkout vundle source
	[[ ! -d vim/bundle/Vundle.vim ]] \
		&& git clone https://github.com/gmarik/Vundle.vim.git vim/bundle/Vundle.vim \
		|| true
	# Install all vim plugins
	vim +PluginInstall +PluginClean +qall

awesome:
	mkdir -p $(DEST)/.config
	rm -rf $(DEST)/.config/awesome
	ln -s $(realpath awesome) $(DEST)/.config/awesome
