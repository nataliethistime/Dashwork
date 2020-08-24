source 'https://rubygems.org'

ruby '2.7.0'

gem 'active_link_to' # Improved active linking library
gem 'bootsnap', '>= 1.4.2', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'config' # Configure the app with yml files
gem 'country_select' # Country selection helper
gem 'devise' # Easy user authentication
gem 'discard', '~> 1.2' # Soft deletion of items
gem 'image_processing'
gem 'jbuilder', '~> 2.7' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'kaminari' # Pagination
gem 'local_time' # Display times to the user in their local timezones
gem 'mini_decorator', '0.0.2' # Model decoration
gem 'mini_magick'
gem 'paper_trail' # Item version tracking
gem 'pg' # Postgress database
gem 'puma', '~> 4.1' # Use Puma as the app server
gem 'rails_admin', '~> 2.0' # Manage the databse
gem 'rails', '~> 6.0.3.2' # Yes, it's a rails app
gem 'ransack' # Search filters
gem 'redcarpet' # Markdown rendering
gem 'sass-rails', '>= 6' # Use SCSS for stylesheets
gem 'simple_form' # Simpler forms
gem 'sprockets', '3.7.2' # Keeping this at 3.7.2 because of a segfault issue in CI
gem 'turbolinks', '~> 5' # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'view_component' # Object based view components
gem 'webpacker', '~> 5.x' # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker

group :development, :test do
  gem 'pry' # Debugging
end

group :development do
  gem 'annotate' # Annotate table attributes on our models
  gem 'better_errors'   # Better errors and debugging
  gem 'binding_of_caller'
  gem 'brakeman' # Static analysis tool
  gem 'bullet'   # Get alerts about potential N+1 issues
  gem 'listen', '~> 3.2'
  gem 'rubocop-rails', require: false
  gem 'rubocop', require: false # Lint our code with Rubocop. See .rubocop.yml
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'minitest'
  gem 'simplecov', require: false
end
