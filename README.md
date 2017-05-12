# supervisor-installer

supervisor init scripts

help you build supervisor environment with joy.

## usage

### pre-requiment

1. pyenv
2. supervisord

### install pyenv, python, supervisor

```
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# assume you are using BASH
echo 'export PATH="${HOME}/.pyenv/bin:$PATH"' | tee -a $HOME/.bash_profile
echo 'eval "$(pyenv init -)"' | tee -a $HOME/.bash_profile
echo 'eval "$(pyenv virtualenv-init -)"' | tee -a $HOME/.bash_profile

export PYTHON_BUILD_MIRROR_URL="http://mirrors.sohu.com/python/" # I think this line isn't functional
export v=2.7.13 ;wget http://mirrors.sohu.com/python/$v/Python-$v.tar.xz -P ~/.pyenv/cache/;pyenv install $v
pyenv rehash
pyenv global 2.7.13
which python

pip install supervisor
```

## install supervisor-installer

```
curl -L https://raw.githubusercontent.com/morya/supervisor-installer/master/bin/supervisor-installer.sh | bash
```
