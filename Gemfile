source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'


# Kaminari pagination gem
gem 'kaminari'

# smarter csv gem to handle large csv files

gem 'smarter_csv'

# delayed job gem

gem 'delayed_job_active_record'
gem 'daemons'


# active record import for solving n+1 insert problem
gem 'activerecord-import'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  # rspec gem for testing
  gem 'rspec-rails', '~> 3.6'
  # Faker gem to hep in testing data
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'

  # shoula matchers for make the model test more easy
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-controller-testing'

  # factory girl
  gem 'factory_girl_rails'

end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
