# CatTinder Validation Example
To see the changes to the JSON object in this app, check out that branch with the following command:
```
$ git checkout reformatted-json
```
and then reference the latest commit.

# API INTRO
$ rails new cat_tinder_backend_instructors -d postgresql -T
$ cd cat_tinder_backend
$ rails db:create
$ bundle add rspec-rails
$ rails generate rspec:install
$ rails server
$ rails generate resource Cat name:string age:integer enjoys:text
$ rails db:migrate
$ rspec spec

# Rails Seed
Bring in data in an array

cats.each do |attributes|
  Cat.create attributes
  puts "creating cat #{attributes}"
end

$ rails db:seed

### Trouble Shooting
$ rails db:drop
$ rails db:create
$ rails db:migrate
$ rails db:seed

# API CORS

1. gem 'rack-cors', :require => 'rack/cors'

2. config/initializers
    create file named cors.rb
```
    # Avoid CORS issues when API is called from the frontend app.
    # Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

    # Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # <- change this to allow requests from any domain while in development.

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```

$ bundle install
