# Simplero Test Project

## Description

This is a simple community platform that allows people to create & join “Groups”.


## Requirements

This project currently works with:

* Ruby 3.1.1
* PostgreSQL
* Redis

## Installation

* Run `bundle install`
* Run `rails db:create db:migrate db:seed`
* To start the project run `./bin/dev`

## What does this project do?

* Users can login/signup
* Users can join groups and view them
* Only members or creators of a group can post in them
* Anyone can comment on a post or reply to comments

## Further Improvements

* Make the view components a little more reusable. Create common cards that can be used all our posts, groups and comments.
