#require 'test_helper'
require 'minitest/autorun'
require_relative '../lib/connect_four'

## Minitest-Klasse zum ConnectFour Projekt 
#
# 2013 Ren� Wernicke

describe "ConnectFour", "Erster Testlauf mit Minitest" do 

	it "Hello-World gibt den richtigen Text aus" do
	
	cf = ConnectFour.new
	cf.hello_world "hello world".must_equal "hello world"
	end
end