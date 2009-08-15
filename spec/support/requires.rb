require 'factory_girl'
require 'shoulda'

Factory.definition_file_paths = [
  File.join(RAILS_ROOT, 'spec', 'factories')
]
Factory.find_definitions