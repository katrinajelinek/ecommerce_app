# Ecommerce App
Ecommerce App is a backend app made with Ruby on Rails framework and PostgreSQL as database and Bcrypt for the user authentication.


# Features
- **App**
  - User Authentication using BCrypt gem
  - Catalog of products
  - List of users
  - History of items stored in a cart
  - History of users' past purchases
  - Seeded data to test app
- **Working on it**
  - Implement Third Party API checkout system (implementation started)


# Getting Setup:
  1. Download or clone the project from Github
  2. To set up PostgreSQL with your Ruby on Rails application, user this tutorial: https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-macos
  3. Navigate into the project directory and run `bundle install` to install all project dependencies. You'll also need to run `rails g money_rails:initializer` for the third party API payment system that has been started
  4. Then run `rails server` to start the web server
  5. Open your browser and go to localhost:3000. You should see a cute "Yay! You're on Rails!" message.


# Database Creation
  1. To set up your database, run `rails db:create`
  2. Then run `rails db:migrate` to create your tables
  3. There is data in the seeds file for products and a user to get you started. To add this to your database, run `rails db:seed`


# Current Versions
  - Rails 6.0.3.5
  - Bcrypt 3.1.7
  - PostgreSQL 13.1


