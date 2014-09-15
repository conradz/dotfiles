DEST := $(HOME)
.PHONY: install bash vim vim_link vundle awesome bin bin_link nvm z x config

TARGETS := bash vim vim_link vundle awesome bin bin_link nvm z x config

ifeq ($(HOSTNAME), dev.conradz.com)
	# headless
	TARGETS := bash vim vim_link vundle bin bin_link nvm z config
endif

install: $(TARGETS)

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

bin: bin_link nvm z
bin_link:
	rm -rf $(DEST)/.bin
	ln -s $(realpath bin) $(DEST)/.bin
nvm:
	[[ ! -d bin/nvm ]] \
		&& git clone https://github.com/creationix/nvm.git bin/nvm \
		|| true
	(cd bin/nvm && git pull)
z:
	[[ ! -d bin/z ]] \
		&& git clone https://github.com/rupa/z.git bin/z \
		|| true
	(cd bin/z && git pull)

x:
	rm -f $(DEST)/.Xresources $(DEST)/.xinitrc
	ln -s $(realpath x/resources) $(DEST)/.Xresources
	ln -s $(realpath x/init) $(DEST)/.xinitrc

config:
	mkdir -p $(DEST)/.config

	rm -f $(DEST)/.config/redshift.conf
	ln -s $(realpath config/redshift.conf) $(DEST)/.config/redshift.conf

	mkdir -p $(DEST)/.config/gtk-3.0
	rm -f $(DEST)/.config/gtk-3.0/settings.ini
	ln -s $(realpath config/gtk3.conf) $(DEST)/.config/gtk-3.0/settings.ini

	rm -f $(DEST)/.gtkrc-2.0
	ln -s $(realpath config/gtk2.conf) $(DEST)/.gtkrc-2.0

	mkdir -p $(DEST)/.config/fontconfig
	rm -f $(DEST)/.config/fontconfig/fonts.conf
	ln -s $(realpath config/fonts.conf) $(DEST)/.config/fontconfig/fonts.conf
