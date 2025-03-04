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

# RAILS UTILS

## Tests:
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

# Testing twyg-app

bash execute RAILS_ENV=test rails db:create
execute RAILS_ENV=test rails db:migrate
execute RAILS_ENV=test rails db:seed
agora só rodar algum arquivo spec com RAILS_ENV=test bundle exec rspec 'caminho para o arquivo de teste'

https://github.com/Twygo/twyg-app/compare/master...develop/ecosystem-part2

# Docker

https://docs.docker.com/guides/ruby/containerize/

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

# SQL

https://www.sqltutorial.org/

## Current task

certificate_notification_service

event_participant = EventParticipant.where(event_id: 65, user_id: 1)

certicateNoti = CertificateNotificationService.new(event_participant, 1, 65, 2)

certicateNoti.send_notification_for_single_participant

1, "Certificado emitido", "Francisca Limeira - evento_0", "/e/1/event_students/1/learning_history?tab=history_certificate&profile=admin"

{
  "message": "Account created successfully.",
  "data": {
      "account": "system-admin",
      "context": "twygo",
      "__v": 0,
      "id": "67c72faafa124471a8579642"
  }
}

activerecord.attributes.event_participant.question_list_name

base_data_export_strategy