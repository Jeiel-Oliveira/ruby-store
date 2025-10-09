## Ruby LSP

instalar ruby lsp no vscode/cursor

https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-lsp

instalar rbenv

https://github.com/rbenv/rbenv (instalar pelo github - não use apt install)

instalar a versão do ruby do projeto (atualmente 3.3.1)

rbenv install 3.3.1

**
  Caso não apareça a versão, rodar comando:
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

** Caso não funcione mesmo assim:
  sudo apt-get update
  sudo apt install build-essential rustc libssl-dev libyaml-dev zlib1g-dev libgmp-dev

utilizar a versão correta na máquina com rbenv

rbenv global 3.3.1 ou rbenv local 3.3.1 (dentro do repositório do projeto)

instalar libmagic-dev para funcionar a gem ruby-filemagic

sudo apt-get install libmagic-dev

in the .ruby-version file change the content to:

3.3.1

install the ruby-lsp gem:

gem install ruby-lsp

If others errors occur, follow the instructions in the output terminal from ruby-lsp

** Se necessário rode:
  gem cleanup date
  gem uninstall date -v 3.4.1

adicionar no .zshrc ou .bashrc

eval "$(~/.rbenv/bin/rbenv init - --no-rehash bash)"