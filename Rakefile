require 'rubygems'
require 'bundler/setup'
require 'rake/testtask'

$LOAD_PATH << "lib/"
require 'connect_four'
require 'game_controller'
require 'player'
require 'field'
require 'text_input'
require 'text_output'


task :default => :test

#Rake starts the test task.
Rake::TestTask.new do |t|
  # Testfile selection.
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

task :four do
  ConnectFour.start
end