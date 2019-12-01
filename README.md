# Purpose

Hi! I've been working on a Rails Engine / Ruby Gem called Epiphany (https://github.com/geekdreamzz/epiphany) which serves as an API for a natural language processing (NLP) model built out in Ruby. This repo is an example application being powered by the Epiphany Gem. The purpose of the demo application is to show you:
* How to install the engine/gem (currently in Alpha)
* Core Features of the Epiphany Gem and the natural language processing (NLP) data model
* How you can then use that as a JSON API for your client application. 

We're in the early stages and more formal documentation for future contributors is in the works. However to gain some excitement and traction, this demo application showcases the ideas and conventions that can be abstracted to any idea you have. For this demo we are creating a simple "Movie Assistant" where you can ask simple questions like: 
* "Suggest a good comedy to watch"
* "Was Avenger's Endgame any good?" 
* "What movies has Ryan Gosling starred in?"

for a live demo visit - https://epiphany-demo.herokuapp.com (if you're the first visitor it'll take a minute to wake it up)

## Dependencies, before getting started:

* This demo was built on Ruby 2.6.3 and Rails 6.0.1 (Epiphany should work with other versions but this is what the demo was built on)

* The data model is stored in a PostgreSQL database. Download: https://postgresapp.com/downloads.html and create a local schema. Note the sample app database.yml. 
  ```
  database: epiphany_demo_development
  username: epiphany_demo_owner
  password: <%= ENV['EPIPHANY_DB_PW'] %>
  ```

## Getting Started 

Clone the repo, and bundle install.

MORE COMING SOON
