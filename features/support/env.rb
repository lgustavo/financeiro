# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] ||= "cucumber"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require 'cucumber/rails/world'

# Comment out the next line if you don't want Cucumber Unicode support
require 'cucumber/formatter/unicode'
require 'factory_girl'
#require File.join( RAILS_ROOT, 'features', 'support', 'selenium_adapter' )

Factory.definition_file_paths = [
  File.join(RAILS_ROOT, 'spec', 'factories')
]
Factory.find_definitions

# Comment out the next line if you don't want transactions to
# open/roll back around each scenario
Cucumber::Rails.use_transactional_fixtures

# Comment out the next line if you want Rails' own error handling
# (e.g. rescue_action_in_public / rescue_responses / rescue_from)
Cucumber::Rails.bypass_rescue

require 'cucumber/rails/rspec'
require 'selenium'
require 'selenium/server'
require 'database_cleaner'
require 'database_cleaner/cucumber'
DatabaseCleaner.strategy = :truncation

system("kill -9 `cat tmp/pids/server.pid`")
system( " script/server -p 3001 -d -e #{Rails.env} " )
system( ' rake selenium:rc:start ' )

BROWSER = Selenium::SeleniumDriver.new(
  :host => "localhost",
  :port => 4444,
  :browser => "*firefox",
  :timeout_in_seconds => 10,
  :url => "http://localhost:3001/")

BROWSER.start

def visit( path )
  BROWSER.open( "http://localhost:3001#{path}" )
end

def should_contain_text( text )
  BROWSER.get_html_source.should include( text )
end

def should_not_contain_text( text )
  BROWSER.get_html_source.should_not include( text )
end

at_exit do
  BROWSER.stop
  system("kill -9 `cat tmp/pids/server.pid`")
  system( ' rake selenium:rc:stop ' )
end

After do |scenario|
  if scenario.failed?
    BROWSER.capture_screenshot(
      File.join(
        RAILS_ROOT,
        'tmp',
        "screenshot_#{Time.now.to_s(:db)}.png" ) )
  end
end
