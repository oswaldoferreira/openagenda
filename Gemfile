source 'https://rubygems.org'

gem 'rails', '4.2.3'
gem 'pg', '0.18.4'
gem 'active_model_serializers', '0.10.0.rc3'

group :test do
  gem 'simplecov',   '0.11.0'
  gem 'shoulda-matchers', '~> 3.0', require: false
  gem 'faker',                '1.6.1'
  gem 'database_cleaner',     '1.5.0'

end

group :development, :test do
  gem 'rspec-rails', '3.4'
  gem 'factory_girl_rails', '4.5.0'
end

group :development, :staging do
  gem 'bullet',    '4.14.10'
end

