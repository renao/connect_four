## ConnectFour -- Beispielprojekt --
# 
# The game controller for the ConnectFour game.
#
# 2013 René Wernicke

module GameController
  require 'field'
  require 'text_output'
  require 'text_input'
  require 'player'
	
  # The default delay time between certain outputs (time in seconds)
  DELAY = 1
  # The dimensions of the game field.
  FIELD_WIDTH = 6
  FIELD_HEIGHT = 7
	
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
  def self.start
    # If the setup is complete the game starts.
      if self.setup_game 
        start_game
      end
    # FutureFeature?: Revenge. Record keeping.
  end

  private
  # Sets ups the game informations.
  #
  # Return: TRUE if game is set up.
    def self.setup_game
      @text_in = TextInput.new(FIELD_WIDTH)
      @field = Field.new(FIELD_WIDTH, FIELD_HEIGHT)
      @text_out = TextOutput.new(DELAY, @field)
      
	  @text_out.show_game_setup
      self.setup_create_players

      @next_turn = @player_o

      true
    end
	
  # Gets the players names via the text input and creates the player objects.
  def self.setup_create_players
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
  def self.start_game
    @text_out.show_game_start
    has_winner = false
	
    while @field.is_playable? && !has_winner
      # Was the token properly inserted into the field?
	  token_inserted = false
	  # Who is playing on the next round?
      @next_turn = (@next_turn == @player_x) ? @player_o : @player_x
      # Get players representation in the fields assignment.
      bool_player = (@next_turn == @player_x) ? true : false
	  
	  # Do not continue until the token was inserted properly.
	  while !token_inserted
        # Show next round information.
        @text_out.show_next_turn(@next_turn.name)
        
		# Get the input.
        next_x = @text_in.get_column

        # Inserts token into the field.
        token_inserted = @field.token_inserted?(next_x.to_i, bool_player)
      end
	  
	  has_winner = @field.has_winner?
	  	
    end
	
	if has_winner
	  @text_out.show_winner_information(@next_turn.name)
	end
	
	if !@field.is_playable?
	  @text_out.show_no_more_moves
	end
  
  end
  
end