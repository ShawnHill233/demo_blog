source 'https://rubygems.org'

gem 'rails', '4.1.5'

gem 'bootstrap-sass', '~> 3.2.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 3.2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Turbolinks makes following links in your web application faster.
gem 'turbolinks'

# Build JSON APIs with ease.
	gem 'jbuilder', '~> 2.0'
# Use CoffeeScript for .js.coffee assets and views
	# gem 'coffee-rails', '~> 4.0.0'
# Use jquery as the JavaScript library
	gem 'jquery-rails'									#rake assets:precompile 生成Heroku静态资源调用
	gem 'jquery-ui-rails'								#rake assets:precompile 生成Heroku静态资源调用
# NewRelic 性能统计
	# gem 'newrelic_rpm'	

gem 'bcrypt', '~> 3.1.7'
gem "wice_grid", '3.4.2'
gem 'redcarpet'

group :development do
	gem 'sqlite3', '1.3.9'
	gem 'rspec-rails', '2.13.1'
	# Spring speeds up development by keeping your application running in the background.
	gem 'spring'
end

group :production do
	gem 'pg'
  gem 'rails_12factor'
end

group :doc do
	gem 'sdoc', '~> 0.4.0'
end

group :test do
	gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
end