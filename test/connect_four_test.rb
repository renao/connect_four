require_relative 'test_helper'
require 'minitest/autorun'
require 'connect_four'

## Minitest for ConnectFour
#
# 2013 René Wernicke


class ConnectFourTest < ConnectFourSpec
  
  # Is the player created correctly?
  def test_create_player
    puts "TEST CREATE PLAYER running..."
	player = ConnectFour::game::Player.new("Rene")
	
    assert_equal "Rene", player.name
    assert_equal 0, player.wins
    assert_equal 0, player.losses
  end
  
  # Is the field created correctly?
  def test_create_field
    field = ConnectFour::Field.new
    
	assert_equal 7, field.width
	assert_equal 6, field.height
	
	#field.height = 10
	#field.width = 5
	
	#assert_equal 10, field.height
	#assert_equal 5, field.width
	
	# TODO: Tests for assignments.
  end
  
  # TODO: Test the Game Controller and its functions.
  # TODO: Test Text-Output and its functions.
  # TODO: Test Text-Input(?) and its functions.
  
end