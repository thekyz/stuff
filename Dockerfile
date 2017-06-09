FROM base/archlinux:latest

ENV http_proxy http://proxy.lbs.alcatel-lucent.com:8000                                                                                                                                                                                                                                                                   
ENV https_proxy http://proxy.lbs.alcatel-lucent.com:8000

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm vim git python-pip curl shellcheck wget base-devel sudo the_silver_searcher

RUN pip install --upgrade pip && \
    pip install pygments

RUN mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors ~/.vim/ftplugin && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
    wget -O ~/.vim/colors/molokai.vim https://raw.githubusercontent.com/flazz/vim-colorschemes/master/colors/molokai.vim && \
    cd ~/.vim/bundle && \
    git clone --depth=1 https://github.com/scrooloose/syntastic.git && \
    git clone --depth=1 https://github.com/vim-airline/vim-airline.git && \
    git clone --depth=1 https://github.com/tpope/vim-dispatch.git && \
    git clone --depth=1 https://github.com/wincent/ferret.git && \
    git clone --depth=1 https://github.com/tpope/vim-surround.git && \
    git clone --depth=1 https://github.com/scrooloose/nerdtree.git && \
    git clone --depth=1 https://github.com/scrooloose/nerdcommenter.git && \
    git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git && \
    git clone --depth=1 https://github.com/FelikZ/ctrlp-py-matcher.git  && \
    git clone --depth=1 https://github.com/terryma/vim-multiple-cursors.git && \
    git clone --depth=1 https://github.com/jtratner/vim-flavored-markdown.git && \
    git clone --depth=1 https://github.com/fatih/vim-go.git && \
    git clone --depth=1 https://github.com/thekyz/vim-ftplugins.git ~/.vim/ftplugin

RUN mkdir ~/dev -p && cd ~/dev && \
    git clone --depth=1 https://github.com/thekyz/stuff.git && \
    ~/dev/stuff/dotfiles/setup_dotfiles.sh

CMD [ "/bin/bash" ]

