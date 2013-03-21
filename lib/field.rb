## ConnectFour -- Beispielprojekt --
# 
# Represents the connect four game field.
#
# 2013 Rene Wernicke

class Field
	# The fields height.
	attr_accessor :height
	# The fields width.
	attr_accessor :width
	
	# Represents the fields assignment in the active game as a 2D array.
	#
	# Possible values:
	#
	# nil - spot is free.
	# true - spot is assigned by player X.
	# false - spot is assigned by player O.
	attr_accessor :assignment
	
	
	# Creates the Field with a width of x and a height of y stones.
	#
	# width - the width of the created field.
	# height - the height of the created field.
	def initialize (width = 6, height = 7)
		# Save height and width and create empty assignment array
		@width = width
		@height = height
		@assignment = Array.new width
		
		width.times do |x|
			@assignment[x] = Array.new height
		end
	end
	
	# Returns if there is still room to move.
	#
	# Returns TRUE, if the field is not filled completely.
	def playable
		is_playable = false
		x = 0
		while ((x < self.width) && (!is_playable))
			is_playable = (@assignment[x][0] == nil);
		end
		is_playable
	end
	
	# Puts a new token into the field.
	#
	# coord - the columns number of the token.
	# player - the player, that inserts the token.
	#
	# Returns TRUE: If the token is inserted correctly.
	# Returns FALSE: If the token is not inserted correctly.
	def insert_token(coord, player)		
		is_inserted = false
		y = 0
		
		# Is the column already filled completely?
		if (@assignment[coord - 1][0] != nil)
			is_inserted = false
		# If there is some room, put it into the spot at its top.
		else
			while ((@assignment[coord - 1][y] == nil) &&(y < self.height))
				y += 1
			end
			@assignment[coord - 1][y - 1] = player
			puts @assignment[coord - 1][y - 1].to_s
			puts y.to_s
			is_inserted = true
		end
		is_inserted
	end
	
end