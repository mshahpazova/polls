
# README

This is rails application for creating, editing and deleting polls with options (possible after logging as an admin) Right now admin functionality is accessible on every page but could be placed on different screen with hardcoded username and password in the database. Users can vote, each user user can vote only once with the name he/she has provided.

### Starting the application
* Run bundle install to install the dependencies

* Database creation: rails db:create
* Seed data rake db:seed

* to run the server use:
rails s

* to run the tests use:
rspec spec

### Required Versions

* Ruby version: 2.6.0
* Rails version: 5.2.2

* Gems that are used:
  * bootstrap
  * jquery-rails
  * devise
  * rspec
  * factory-bot
  * rspec-rails