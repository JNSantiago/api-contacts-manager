require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'database_cleaner'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  #********** BEGIN CONFIGURATION DATABASE_CLEANER *********
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end  
  #********** END OF CONFIGURATION DATABASE_CLEANER *********

  #********** BEGIN OF CONFIGURATION FACTORY GIRL ***********
  config.include FactoryGirl::Syntax::Methods
  #********** END OF CONFIGURATION FACTORY GIRL *************

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

#************ BEGIN CONFIGURATION OF SHOULDA_MATCHERS ********
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
#*********** END CONFIGURATION OF SHOULDA_MATCHERS ***********