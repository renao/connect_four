require_relative 'test_helper'
require 'minitest/autorun'
require 'player'

## Minitest for ConnectFour
#
# 2013 René Wernicke

class PlayerTest < ConnectFourSpec
  
  # Is the player created correctly?
  def test_create_player
    player = Player.new("Hans")
    
	assert_instance_of Player, player
    # Testing defaults
    assert_equal "Hans", player.name
    assert_equal 0, player.wins
    assert_equal 0, player.losses
	
	# TODO: Causing an wanted Error in MiniTest
	#assert_raises ArgumentError, Player.new
  end
  
end