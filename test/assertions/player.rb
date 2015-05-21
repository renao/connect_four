module Assertions

  def assert_player(player, name, wins, losses)
    assert_equal name, player.name
    assert_equal wins, player.wins
    assert_equal losses, player.losses
  end
end