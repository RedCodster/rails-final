source 'https://rubygems.org'

ruby '2.2.3' # change the version if needed
gem 'rails', '4.2.5.2' # change the version if needed

gem 'pg'
gem 'sass-rails', '~> 5.0'
# gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'unicorn'
gem 'bower'
gem 'rack-cors', :require => 'rack/cors'
gem 'devise_token_auth'
gem 'omniauth'

group :development do
  gem "web-console"
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "pry-rails"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "rspec-rails", "~> 3.0"
end

group :production do
  gem 'rails_12factor'
end

