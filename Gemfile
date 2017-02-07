source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

gem 'angular-rails-templates'
gem 'angular_rails_csrf'
gem 'bootstrap', '~> 4.0.0.alpha3.1'
gem 'bower-rails'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-sass'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.1'
gem 'responders'
gem 'rest-client'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'therubyracer'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'capybara'
  gem 'capybara-email'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'json_spec'
  gem 'launchy'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop', '~> 0.47.1', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'phantomjs', require: 'phantomjs/poltergeist'
  gem 'poltergeist'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'webmock'
end
