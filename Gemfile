source 'https://rubygems.org'

ruby '2.7.0'

# Yes, it's a rails app
gem 'rails', '~> 6.0.3', '>= 6.0.3.1'

# Postgress database
gem 'pg'

# Use Puma as the app server
gem 'puma', '~> 4.1'

# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Model decoration
gem 'mini_decorator', '0.0.2'

# Easy user authentication
gem 'devise'

# Display times to the user in their local timezones
gem 'local_time'

# Pagination
gem 'kaminari'

# Image processing
gem 'image_processing'
gem 'mini_magick'

# Configure the app with yml files
gem 'config'

# Search filters
gem 'ransack'

# Simpler forms
gem 'simple_form'

# Country selection helper
gem 'country_select'

# Markdown rendering
gem 'redcarpet'

group :development, :test do
  # Debugging
  gem 'pry'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Annotate table attributes on our models
  gem 'annotate'

  # Lint our code with Rubocop. See .rubocop.yml
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false

  # Get alerts about potential N+1 issues
  gem 'bullet'

  # Better errors and debugging
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'minitest'
  gem 'simplecov', require: false
end
