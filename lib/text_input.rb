## ConnectFour -- Beispielprojekt --
# 
# Receives the text inputs for the game of ConnectFour.
#
# 2013 René Wernicke

class TextInput
	
	# The maximum width of the games field.
	@max_width
	
	# Sets up the text input controller.
	def initialize max_width
		@max_width = max_width
	end
	
	# Gets the non-validated name entry.
	#
	# RETURN players name.
	def get_player_name
		name = STDIN.gets.chomp
		name
	end
	
	# Gets a validated coordinate entry.
	#
	# RETURN Column number.
	def get_coordinate
	coord = 0
	coord = STDIN.gets.chomp
	# Validation - if it fails, get another
	(coord_valid? coord) ? coord : (self.get_coordinate)
	end
	
	# Validates the input to be an integer within the width of the games tableau.
	def coord_valid? coord
	is_valid = true
		if ((coord.to_i < 1) or (coord.to_i > @max_width))
			puts "Well, there went something wrong with your input: #{coord}. Please try again:"
			is_valid = false
		end
	is_valid
	end
	
end