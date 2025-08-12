# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Documentation

Finished the base tutorial:

https://guides.rubyonrails.org/getting_started.html#what-s-next-questionmark

Currently learning abord active record Martin Fowler pattern

https://guides.rubyonrails.org/active_record_basics.html#validations

tail -f log/development.log | grep -E "Started |Processing by"

tail -f log/development.log | awk '   /Started/ {print "\033[33m" $0 "\033[0m"; next}   /Processing by/ {print "\033[32m" $0 "\033[0m"; print ""; print ""; next}   {next}'

## Caching guide
https://guides.rubyonrails.org/v7.1/caching_with_rails.html

# RAILS UTILS

## Tests
bin/rails test

## Linting and formating:
bin/rubocop -a

## Security:
bin/brakeman

## Model and active record:
bin/rails generate model Book title: string author: string

## Reset migrations:
bin/rake db:migrate:reset

## Controller:
bin/rails generate controller Books

## Drop table:
ActiveRecord::Migration.drop_table(:your_table_name)

## Tailwind:css

Para desenvolver em local
bin/rails tailwindcss:watch

Para buildar
bin/rails tailwindcss:build

https://tailwindcss.com/docs/installation/framework-guides/ruby-on-rails

https://www.rubyguides.com/2020/03/rails-scaffolding/

# Testing twyg-app

bash execute RAILS_ENV=test rails db:create
execute RAILS_ENV=test rails db:migrate
execute RAILS_ENV=test rails db:seed
agora só rodar algum arquivo spec com RAILS_ENV=test bundle exec rspec 'caminho para o arquivo de teste'

https://github.com/Twygo/twyg-app/compare/master...develop/ecosystem-part2

# Docker

https://docs.docker.com/guides/ruby/containerize/

## Tutorial docker on rails

https://semaphore.io/community/tutorials/dockerizing-a-ruby-on-rails-application

# Branchs and users

localhost

org.jeiel@yopmail.com
1741008789YMYuuv0XFGIVfJiISHGxIrdlmcsQRQOsnKXhwqF8aT0
123456

org.tati@yopmail.com
1741009165jDbGE060p-jyinfsvVTpiZHN16X_CGsDfPU10MFtmcc
123456

https://stage.twygo.com/

dev@teste.com
123456

https://campecossistema2.stage.twygoead.com
jeiel.oliveira@twygo.com
123456

https://orghouse.stage.twygoead.com/
jeiel.oliveira@twygo.com
123456

hitechhardware.stage.twygoead.com
jeiel.oliveira@twygo.com
123456

usuario@euax.com.br
123456

# TWYGO

## Criar nova organicação:

https://stage.twygoead.com/new/register/steps

## Microserviços

git@github.com:Twygo/euax-microservices.git

https://github.com/Twygo/twyg-app/wiki/Como-montar-o-ambiente-de-Microservi%C3%A7os-local-com-desenvolvimento

## Ruby LSP

instalar ruby lsp no vscode/cursor

https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-lsp

instalar rbenv

https://github.com/rbenv/rbenv

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

# SQL

https://www.sqltutorial.org/