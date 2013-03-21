## ConnectFour -- Beispielprojekt --
# 
# Describes the well-known "ConnectFour" game.
#
# 2013 René Wernicke

require 'game_controller'

module ConnectFour
  attr_accessor :game
  # Inits the game controller and starts the game.
  def self.start
    @game = GameController.start
  end
end

