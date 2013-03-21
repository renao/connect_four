## ConnectFour -- Beispielprojekt --
# 
# The game controller for the ConnectFour game.
#
# 2013 René Wernicke

class Game_Controller
	require_relative 'Field'
	require_relative 'Text_Output'
	require_relative 'Text_Input'
	require_relative 'Player'
	
	# The default delay time between certain outputs (time in seconds)
	@@Delay = 1
	# The dimensions of the game field.
	@@Field_width = 6
	@@Field_height = 7
	
	# The active game field.
	@field
	# The active players.
	@player_x
	@player_o
	# The text output device.
	@text_out
	# The text input device.
	@text_in
	# The next game turns player.
	@next_turn

	
	# Inits a new game.
	def initialize
		# If the setup is complete the game starts.
		if self.setup_game 
			start_game
		end
		# FutureFeature?: Revenge. Record keeping.
	end
	
	# Sets ups the game informations.
	#
	# Return: TRUE if game is set up.
	def setup_game
		@text_in = Text_Input.new (@@Field_width)
		@field = Field.new(@@Field_width, @@Field_height)
		@text_out = Text_Output.new(@@Delay, @field)
		@text_out.show_game_setup
		self.setup_get_player_names
		
		@next_turn = @player_o
		
		true
	end
	
	# Gets the players names via the text input and creates the player objects.
	def setup_get_player_names
		# First player - Player X
		@text_out.show_enter_player "X"
		@player_x = Player.new(@text_in.get_player_name)
		@text_out.show_thanks_player(@player_x.name, "X")
		
		# Second player - Player O
		@text_out.show_enter_player "O"
		@player_o = Player.new(@text_in.get_player_name)
		@text_out.show_thanks_player(@player_o.name, "O")
	end
	
	# Starts the game. (Represents the games main-loop).
	def start_game
		@text_out.show_game_start
	
		while @field.playable
			# Who is playing in the next round?
			@next_turn = (@next_turn == @player_x) ? @player_o : @player_x
			
			# ...show it...
			@text_out.show_next_turn(@next_turn)
			# ... get his/her input.
			next_x = @text_in.get_coordinate
			
			# Get players representation in the fields assignment.
			bool_player = (@next_turn == @player_x) ? true : false
			
			# Inserts token into the field.
			@field.insert_token(next_x.to_i, bool_player)
			
			# TODO: Check if token was inserted correctly.
			# TODO: Check if somebody has won the game.
			
		end
	end
	
end