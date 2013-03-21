require 'rubygems'
require 'bundler/setup'
require 'rake/testtask'

# Add lib/ dir to load path
$LOAD_PATH << "lib/"

# load file 'lib/connect_four.rb'
require 'connect_four'
# load file 'lib/connect_four/game_controller.rb'
require 'connect_four/game_controller'
# load file 'lib/connect_four/player.rb'
require 'connect_four/game_controller/player'
# load file 'lib/connect_four/field.rb'
require 'connect_four/game_controller/field'
# load file 'lib/connect_four/text_input.rb'
require 'connect_four/game_controller/text_input'
# load file 'lib/connect_four/text_output.rb'
require 'connect_four/game_controller/text_output'


task :default => :test

#Rake starts the test task.
Rake::TestTask.new do |t|
  # Testfile selection.
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end