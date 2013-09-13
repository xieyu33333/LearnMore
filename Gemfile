#source 'https://rubygems.org'
source 'http://ruby.taobao.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'jquery-rails'
  gem 'bootstrap-sass'
  gem "compass-rails", "~> 1.0.3"
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'brakeman', "~> 1.9"
  gem 'quiet_assets'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'awesome_print'
  gem 'guard-rspec'
  gem 'spork'
  gem 'guard-spork'
  gem 'annotate'
  gem 'thin'
end

group :test do
  gem 'capybara'
  gem 'growl' if /darwin/ =~ RUBY_PLATFORM
  gem 'rb-fsevent' , :require => false
  gem 'libnotify' if /linux/ =~ RUBY_PLATFORM
  gem 'rb-inotify' if /linux/ =~ RUBY_PLATFORM
end

group :production do
  gem 'unicorn'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
gem 'mysql2'
gem 'grape'
gem 'grape-entity'
gem 'cancan'
gem 'cache_digests'
gem 'dalli', '~> 2.3.0'
gem 'second_level_cache', "~> 1.6", :git => 'git://github.com/csdn-dev/second_level_cache.git'
gem 'hiredis'
gem "redis", :require => ["redis", "redis/connection/hiredis"]
gem 'bcrypt-ruby'
gem 'unicorn'
gem 'kaminari'
gem "rails_kindeditor"
gem 'carrierwave'
gem 'mime-types'
gem "mini_magick"
gem "devise"
gem "warden"
gem 'uuidtools'
gem "omniauth", "~> 1.0.1"
gem 'redcarpet'
gem 'coderay'
gem 'acts_as_commentable', '~> 3.0.1'
gem "nokogiri", "~> 1.6.0"
#gem "markitup-rails"
gem 'gon'
#gem 'faye'
#gem 'whenever'
gem 'faye-rails'
gem 'rufus-scheduler'   #计划任务
gem 'turbolinks'
gem 'jquery-turbolinks'
#gem 'cologger'