# README

### Note List App.

##### To Do:
* Add stylelint to pre-commit hook.
* Clean up the ajax search results.
* Clean up and remove unnecessary JavaScript.

### Setup:
* Clone the repo
* Create `.env` files at the root of this project:
  * .env
  * .env.development
  * .env.test
  * Add `SHOW_TAG_BUTTON=true` to both the 'test' and 'development' versions.
    * Set this value to `false` in the 'production' (.env file) version.
    * *Note:* You have to restart your server after adding these files.

### Additional Tool Instructions:
* Start Guard: `bundle exec guard`

### Steps Used in setting up this project:

#### Create Initial App:
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

##### Add Tag association:
`rails g model tag title:string note:references`

##### Create the tags controller:
`rails g controller tags`
