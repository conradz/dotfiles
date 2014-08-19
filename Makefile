DEST := $(HOME)
.PHONY: install vim

install: vim

vim: vim_link vundle

vim_link:
	# remove existing vim configuration
	rm -rf $(DEST)/.vim $(DEST)/.vimrc
	# create links for vim configuration
	ln -s $(realpath vim) $(DEST)/.vim
	ln -s $(realpath vim/vimrc) $(DEST)/.vimrc

vundle:
	# Create the bundle folder if it doesn't exist
	mkdir -p vim/bundle
	# Checkout vundle source
	[[ ! -d vim/bundle/Vundle.vim ]] \
		&& git clone https://github.com/gmarik/Vundle.vim.git vim/bundle/Vundle.vim \
		|| true
	# Install all vim plugins
	vim +PluginInstall +PluginClean +qall
