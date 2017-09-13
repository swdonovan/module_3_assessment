source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.4'
gem "sqlite3"
gem "sass-rails"
gem "uglifier"
gem "coffee-rails"
gem "jquery-rails"
gem "turbolinks"
gem "jbuilder"
gem "faker"
gem "therubyracer"
gem "less-rails-bootstrap"

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rack_session_access'
  gem 'rspec-rails'
  gem "pry", :require => "pry"
  gem 'capybara'
end

group :test do
  gem 'database_cleaner'
  gem 'faker'
  gem 'launchy'
end
