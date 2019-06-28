# README

### Note List App.

#### Setup Instructions:
`rails new plot-notes -T`

##### Create Model:
`rails g model list title:string`

##### Setup rspec:
* Add to gemfile: `gem 'rspec-rails', '~> 3.7'`
* Run `bundle install`
* Run: `rails generate rspec:install`

##### Create rspec model test file:
`rails g rspec:model list`

##### Create the controller:
`rails g controller lists`

##### Add feature test file:
`rails g rspec:feature lists`

##### Added other gems:
- Look at GemFile


##### Add Note association:
`rails g model note title:string details:string list:references`

##### Create the notes controller:
`rails g controller notes`

##### Add Notes feature spec:
`rails g rspec:feature notes`

##### To Do:
* Add tagging ability for each note.
* Add stylelint to pre-commit hook.
* Add guard