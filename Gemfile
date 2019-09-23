source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 6.0.0'
gem 'pg', '~> 1.1', '>= 1.1.4'
gem 'puma', '~> 3.11'
gem 'jbuilder', '~> 2.7'
gem 'redis', '~> 4.0'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'rubocop', '~> 0.74.0'
gem 'guard', '~> 2.15', '>= 2.15.1'
gem 'guard-rubocop', '~> 1.3'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.4', '>= 3.4.2'
  gem 'simplecov', '~> 0.12.0'
end

group :test do
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
  gem 'factory_bot_rails', '~> 5.0', '>= 5.0.2'
  gem 'faker', '~> 2.4'
  gem 'database_cleaner', '~> 1.7'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
