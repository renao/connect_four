## ConnectFour -- Beispielprojekt --
# 
# Describes the well-known "ConnectFour" game.
#
# 2013 René Wernicke

require 'game_controller'

module ConnectFour
	
  # Inits the game controller and starts the game.
  attr_accessor :game
  @game = GameController.start
  
end

