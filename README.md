# README

I created a notification microservice which comunicate with a send sms service.

Things you may want to cover:

* Ruby version
  - 2.3.1

* System dependencies
    - rails 5.0
    - twilio-ruby
    - dotenv-rails
    - database_cleaner

* Configuration
    - just set your ruby environment with rails, bundler and nokogiri gems and after run bundle install in your terminal
    - see database.yml, application.rb
    - observe lib folder
    
* Database creation
    - rails db:create
    
* Database initialization
    - rails db:migrate

* How to run the test suite
    - observe rails_helper.rb and spec_helper.rb configuration
    - I created a stub for sms testing in lib folder: fake_sms.rb
    - run rspec

* Services (job queues, cache servers, search engines, etc.)
    1. Twilio service
        - if you have only a test user, you can send sms just to your verified phone (change 1234567890 with that)
        - you can check twilio sms service with next command:
            curl -X POST -d "notification[phone]=1234567890" -d "notification[body]=twiliomessage" -d "notification[source_app]=twilioapp" http://localhost:3000/notifications
