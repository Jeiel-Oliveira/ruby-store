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

## Caching guide

https://guides.rubyonrails.org/v7.1/caching_with_rails.html

# Generating models an controllers

model and active record:

bin/rails generate model Book title: string author: string

controller:

bin/rails generate controller Books

# Utils

Tests:
bin/rails test

Linting and formating:
bin/rubocop -a

Security:
bin/brakeman

# Drop table

ActiveRecord::Migration.drop_table(:your_table_name)

# Testing twyg-app

no bash execute RAILS_ENV=test rails db:create
execute RAILS_ENV=test rails db:migrate
execute RAILS_ENV=test rails db:seed
agora só rodar algum arquivo spec com RAILS_ENV=test bundle exec rspec 'caminho para o arquivo de teste'

https://github.com/Twygo/twyg-app/compare/master...develop/ecosystem-part2

# Docker

https://docs.docker.com/guides/ruby/containerize/

Possible anwser for mysql2 gem error:

https://stackoverflow.com/questions/3608287/error-installing-mysql2-failed-to-build-gem-native-extension

# Branchs and users

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

Criar nova branch:

https://stage.twygoead.com/new/register/steps

# Current task

filter-options.tsx -> 156

filter-fields.tsx