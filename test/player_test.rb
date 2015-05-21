require 'test_helper'
require 'player'

class PlayerTest < ConnectFourSpec

  def setup
    @player = Player.new "Hans"
  end

  def teardown
    @player = nil
  end

  def test_init_player
    assert_player @player, "Hans", 0, 0
  end

end