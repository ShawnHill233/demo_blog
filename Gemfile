#source 'https://rubygems.org'
source 'https://ruby.taobao.org'

gem 'rails', '4.1.5'

gem 'bootstrap-sass', '~> 3.2.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 3.2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Turbolinks makes following links in your web application faster.
gem 'turbolinks'

# Build JSON APIs with ease.
	# gem 'jbuilder', '~> 2.0'
# Use CoffeeScript for .js.coffee assets and views
	# gem 'coffee-rails', '~> 4.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'									#rake assets:precompile 生成Heroku静态资源调用 , admin 调用 
gem 'jquery-ui-rails'								#rake assets:precompile 生成Heroku静态资源调用 , admin 调用
# NewRelic 性能统计
	# gem 'newrelic_rpm'	

gem 'bcrypt', '~> 3.1.7'
gem "wice_grid", '3.4.10'
gem 'redcarpet'
gem 'coderay'
gem 'will_paginate', '~> 3.0'   	  #paging
gem 'will_paginate-bootstrap'

group :doc do
	gem 'sdoc', '~> 0.4.0'
end

group :development, :production do
	gem 'sqlite3', '1.3.9'
	# Spring speeds up development by keeping your application running in the background.
	gem 'spring'
end

group :test do
	gem 'capybara'
end

group :development, :test do
	gem 'rspec-rails', '3.1.0'
	gem 'guard-rspec', '4.3.1'
	gem 'spork-rails', '4.0.0'
	gem 'guard-spork', '1.5.1'
# Capistrano 
  gem 'capistrano-rails',   '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false


end

# Capistrano 
gem 'rake'
gem 'capistrano', '~> 3.0', require: false, group: :development
gem 'capistrano-rvm'


