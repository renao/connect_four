## ConnectFour -- Beispielprojekt --
# 
# Describes a player in the game of ConnectFour.
#
# 2013 René Wernicke

class Player
	# The players name.
	attr_accessor :name
	# ...for the future: record keeping.
	attr_accessor :wins
	attr_accessor :losses
	
	# Creates a player with his name
	def initialize (name)
		@name = name
		@wins, @losses = 0, 0;
	end
	
end