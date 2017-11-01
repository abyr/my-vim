mv ~/.vim ~/.vim_old

mv ~/.vimrc ~/.vimrc_old

git clone git://github.com/tpope/vim-pathogen.git pathogen

mkdir ~/.vim

mv pathogen/autoload ~/.vim/autoload

cp .vimrc ~/.vimrc

