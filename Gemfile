source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use Puma as the app server
gem 'puma', '~> 3.0'

gem 'sqlite3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 0.4.0'

gem 'knock', '~> 1.4.2'

# HTTP Client side connection
gem 'faraday', '0.9.1'
gem 'faraday_middleware', '0.10.0'
gem 'faraday-conductivity', '0.3.1'
gem 'httpclient', '2.6.0.1'

# Dot env
gem 'dotenv-rails', groups: [:development, :test]

group :development, :test do
  # Call 'binding.pry' anywhere in the code to stop execution and get a debugger console
  gem 'pry', '~> 0.10.4'
  gem 'pry-nav', '~> 0.2.4'

  # Use RSpec for specs
  gem 'rspec-rails', '>= 3.5.0'

  # Use Factory Girl for generating random test data
  gem 'factory_girl_rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rails-controller-testing', '~> 1.0.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
