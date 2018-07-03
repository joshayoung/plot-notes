# README

### Note List App.

#### Setup Instructions:
`rails new plot-notes -T`

##### Create Models:
`rails g model list title:string`

##### Setup rspec:
* Add to gemfile: `gem 'rspec-rails', '~> 3.7'`
* Run `bundle install`
* Run: `rails generate rspec:install`