source 'https://rubygems.org'

gem 'rails', '4.1.6'
gem 'sqlite3'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'

group :doc do 
  gem 'sdoc', '~> 0.4.0'
end

group :development do 
  gem 'spring'

  case RbConfig::CONFIG['host_os']
  when /darwin/i
    gem 'terminal-notifier-guard'
    gem 'rb-fsevent'
  when /linux/i
    # linux
  when /mswin|windows/i
    # windows
  end
end

group :development, :test do 
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do 
  # gem 'capybara'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'launchy'
end
