# mv ~/.vim ~/.vim_old
# mv ~/.vimrc ~/.vimrc_old
# cp .vimrc ~/.vimrc

# rm -rf autoload
# rm -rf bundle

git clone git://github.com/tpope/vim-pathogen.git pathogen
mv pathogen/autoload autoload
rm -rf pathogen

mkdir bundle

git clone git://github.com/elzr/vim-json.git bundle/vim-json
git clone git://github.com/scrooloose/nerdtree.git bundle/nerdtree
git clone git://github.com/corntrace/bufexplorer.git bundle/bufexplorer
git clone git://github.com/scrooloose/syntastic.git bundle/syntastic
git clone git://github.com/vim-scripts/vimwiki.git bundle/vimwiki
git clone git://github.com/airblade/vim-gitgutter.git bundle/vim-gitgutter
git clone git://github.com/tpope/vim-fugitive.git bundle/vim-fugitive
git clone git://github.com/mattn/emmet-vim.git bundle/emmet-vim
git clone git://github.com/vim-scripts/ScrollColors.git bundle/ScrollColors
git clone git://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
git clone git://github.com/ervandew/supertab.git bundle/supertab
