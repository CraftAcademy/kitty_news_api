source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'

gem 'bootsnap', '>= 1.2', require: false
gem 'rails', '~> 6.0.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rack-cors', require: 'rack/cors'
gem 'active_model_serializers'

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
  gem 'coveralls',  require:  false
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end