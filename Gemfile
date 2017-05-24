source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# gems default rails
gem 'rails', '~> 5.1.1'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'sqlite3'
gem 'puma', '~> 3.7'

# gems inserted for me
gem 'pry'
gem 'responders'

group :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda-matchers', '~> 3.0.0'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end