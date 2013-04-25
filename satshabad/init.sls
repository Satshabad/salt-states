pkgs:
  pkg.installed:
    - pkgs:
      - mosh
      - vim
      - zsh
      - tmux
      - python-pip
      - git

{{ pillar['satshabad']['username'] }}:
  user.present:
    - shell: /bin/zsh
    - fullname: Satshabad Khalsa
    - require:
      - pkg: pkgs

install_oh_my_zsh:
  cmd:
    - run
    - name: wget -N --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
    - user: {{ pillar['satshabad']['username'] }}
    - shell: /bin/zsh
  require:
    - user: {{ pillar['satshabad']['username'] }}

id_dsa.pub:
  ssh_auth.present:
    - source: salt://satshabad/id_dsa.pub
    - user: {{ pillar['satshabad']['username'] }}

https://github.com/Satshabad/dotfiles:
  git.latest:
    - target: {{ pillar['satshabad']['home'] }}
    - force: true

# vim stuff


git://github.com/tpope/vim-pathogen.git:
  git.latest:
    - target: {{ pillar['satshabad']['home'] }}/.vim
    - force: True
    - require:
      - pkg: pkgs
      - git: https://github.com/Satshabad/dotfiles

wget -N -P {{ pillar['satshabad']['home'] }}/.vim/colors/ http://raw.github.com/garybernhardt/dotfiles/master/.vim/colors/grb256.vim:
  cmd:
    - run
    - require:
      - git: git://github.com/tpope/vim-pathogen.git

wget -N -P {{ pillar['satshabad']['home'] }}/.vim/colors/ https://raw.github.com/vim-scripts/desert256.vim/master/colors/desert256.vim:
  cmd:
    - run
    - require:
      - git: git://github.com/tpope/vim-pathogen.git

wget -N -P {{ pillar['satshabad']['home'] }}/.vim/plugin/ https://raw.github.com/vim-scripts/YankRing.vim/master/plugin/yankring.vim:
  cmd:
    - run
    - require:
      - git: git://github.com/tpope/vim-pathogen.git


git://github.com/terryma/vim-multiple-cursors.git:
  git.latest:
    - target: {{ pillar['satshabad']['home'] }}/.vim/bundle/vim-snipmate
    - require:
      - pkg: pkgs
      - git: git://github.com/tpope/vim-pathogen.git

git://github.com/terryma/vim-expand-region.git:
  git.latest:
    - target: {{ pillar['satshabad']['home'] }}/.vim/bundle/vim-snipmate
    - require:
      - pkg: pkgs
      - git: git://github.com/tpope/vim-pathogen.git



git clone http://github.com/sjl/gundo.vim.git ~/.vim/bundle/gundo
  git.latest:
    - target: {{ pillar['satshabad']['home'] }}/.vim/bundle/vim-snipmate
    - require:
      - pkg: pkgs
      - git: git://github.com/tpope/vim-pathogen.git

git://github.com/garbas/vim-snipmate.git:
  git.latest:
    - target: {{ pillar['satshabad']['home'] }}/.vim/bundle/vim-snipmate
    - require:
      - pkg: pkgs
      - git: git://github.com/tpope/vim-pathogen.git

git://github.com/tomtom/tlib_vim.git:
  git.latest:
    - target: {{ pillar['satshabad']['home'] }}/.vim/bundle/tlib
    - require:
      - pkg: pkgs
      - git: git://github.com/tpope/vim-pathogen.git

git://github.com/MarcWeber/vim-addon-mw-utils.git:
  git.latest:
    - target: {{ pillar['satshabad']['home'] }}/.vim/bundle/vim-addon-mw-utils
    - require:
      - pkg: pkgs
      - git: git://github.com/tpope/vim-pathogen.git

git://github.com/airblade/vim-gitgutter.git:
  git.latest:
    - target: {{ pillar['satshabad']['home'] }}/.vim/bundle/vim-gitgutter
    - require:
      - pkg: pkgs
      - git: git://github.com/tpope/vim-pathogen.git

git://github.com/tpope/vim-repeat.git:
  git.latest:
    - target: {{ pillar['satshabad']['home'] }}/.vim/bundle/vim-repeat
    - require:
      - pkg: pkgs
      - git: git://github.com/tpope/vim-pathogen.git

git://github.com/jpalardy/vim-slime.git:
  git.latest:
    - target: {{ pillar['satshabad']['home'] }}/.vim/bundle/vim-slime
    - require:
      - pkg: pkgs
      - git: git://github.com/tpope/vim-pathogen.git
      
git://github.com/tpope/vim-surround.git:
  git.latest:
    - target: {{ pillar['satshabad']['home'] }}/.vim/bundle/vim-surround
    - require:
      - pkg: pkgs
      - git: git://github.com/tpope/vim-pathogen.git

