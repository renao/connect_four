## ConnectFour -- Beispielprojekt --
# 
# Creates the console output for ConnectFour.
#
# 2013 René Wernicke

class TextOutput
	
	# Delay between certain outputs (time in seconds).
	@delay
	# The current game field.
	@field
	
	# Sets up the text output.
	#
	# delay - Default delay for certain outputs.
	# field - The current game field.
	def initialize delay=1, field
		@delay = delay
		@field = field
	end
	
	# Shows the initial game text.
	def show_game_setup
		puts "ConnectFour - neopoly GmbH"
		puts "2013 Rene Wernicke"
		self.show_empty_row
		puts "Let's play a game of ConnectFour!"
		sleep(@delay)
	end
	
	# Shows the request input for players name text.
	#
	# symbol - represents the players specific ingame symbol.
	def show_enter_player symbol
		self.show_empty_row
		puts "Player #{symbol}: Please enter your name:"
	end
	
	# Shows the text after a players name is entered.
	#
	# name - The players name.
	# symbol - The players specific ingame symbol.
	def show_thanks_player name, symbol
		puts "Thank you, #{name} - Your symbol will be #{symbol}."
		self.show_empty_row
		sleep(@delay)
	end
	
	# Shows the game initiation text.
	def show_game_start
		self.show_empty_row
		puts "The game starts now - enjoy!"
		sleep(@delay * 2)
	end
	
	# Shows the text for the next game turn.
	#
	# player - The active player.
	def show_next_turn player
		self.show_empty_row
		self.show_lines
		sleep(@delay)
		self.show_empty_row
		sleep(@delay)
		puts "It's your turn #{player.name}. Please enter the columns number for your next move."
	end

	# Shows the lines of the game field.
	def show_lines
		self.show_empty_row
		puts "::: Current Field :::"
		self.show_empty_row
		
		y = 0;
		while (y < @field.height)
			act_line = ""
			x = 0
			while (x < @field.width)
				active = @field.assignment[x][y]
				act_part = (active == nil) ? " -  " : (active == true) ? " X  " : " O  ";
				act_line += act_part
				x += 1;
			end
			puts act_line;
			y += 1
		end
		self.show_empty_row
		
		1.upto(@field.width) { |x| print " #{x}  " }
		
		self.show_empty_row
	end
	
	# Shows an empty row.
	def show_empty_row
		puts ""
	end
	
end