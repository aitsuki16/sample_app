source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.5"

gem "rails", "~> 7.0.4"
gem "pg", "~> 1.5"         # Moved pg outside of groups to be available in all environments
gem "webrick"
gem "bcrypt", "3.1.18"
gem "sprockets-rails"
gem "ostruct"
gem "logger"
gem "bigdecimal"
gem "mutex_m"
gem "base64"
gem "drb"
gem "bootstrap-sass", "3.4.1"
gem "faker", "2.21.0"
gem "will_paginate", "3.3.1"
gem "bootstrap-will_paginate", "1.0.0"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", require: false

group :development do
  gem "web-console"
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
end
group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
