require 'selenium'
require 'selenium_client'

require 'database_cleaner'
require 'database_cleaner/cucumber'
DatabaseCleaner.strategy = :truncation

system("kill -9 `cat tmp/pids/server.pid`")
system( " script/server -p 3001 -d -e #{Rails.env} " )

SERVER = Selenium::Server.new( 4444, 600 )
BROWSER = Selenium::SeleniumDriver.new( 
  :host => "localhost",
  :port => 4444,
  :browser => "*firefox",
  :timeout_in_seconds => 10,
  :url => "http://localhost:3001")

Before do

  SERVER.start
  puts 'antes de iniciar o browser'
  BROWSER.start
  BROWSER.open( "http://google.com/" )
  puts 'depois de iniciar bwoser '
end

def visit( path )
  BROWSER.open( "http://localhost:3001#{path}" )
end

at_exit do
  system("kill -9 `cat tmp/pids/server.pid`")
  system( "wget http://localhost:4444/selenium-server/driver/?cmd=shutDown" )
  BROWSER.close
end