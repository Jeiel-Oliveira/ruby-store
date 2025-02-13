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