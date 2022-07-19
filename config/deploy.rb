lock "~> 3.16.0"

append :linked_files, '.env'
append :linked_files, 'db/production.sqlite3'
append :linked_dirs, 'tmp'
append :linked_dirs, 'log'

set :application, "dashwork"
set :repo_url, "git@github.com:1vasari/Dashwork.git"
set :branch, :main
set :deploy_to, "/var/www/dashwork.app"
set :keep_releases, 5
set :rails_env, 'production'
set :bundle_gemfile, 'Gemfile'
set :rvm_ruby_version, File.read(File.join(__dir__, '../.ruby-version')).strip
