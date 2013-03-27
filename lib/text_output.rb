## ConnectFour -- Beispielprojekt --
# 
# Creates the console output for ConnectFour.
#
# 2013 René Wernicke

class TextOutput
  
  # Delay between certain outputs (time in seconds).
  attr_reader :delay
  # The current game field.
  attr_reader :field
  
  # Predefined texts for the output.
  TEXT_GAME_SETUP = "ConnectFour - neopoly GmbH\n2013 Rene Wernicke\n\nLet's play a game of ConnectFour!"
  TEXT_ENTER_PLAYER = "\nPlayer {player_symbol}: Please enter your name:"
  TEXT_THANKS_PLAYER = "Thank you, {player_name} - Your symbol will be {player_symbol}.\n"
  TEXT_GAME_START = "\nThe game starts now - enjoy!"
  TEXT_NEXT_TURN = "It's your turn {player_name}. Please enter the columns number for your next move."
  TEXT_LINES_HEADLINE = "\n::: CURRENT FIELD :::\n"
  TEXT_WINNER_INFORMATION = "\nCongratulations, {player_name}! You won this incredible game!"
  TEXT_NO_MORE_MOVES = "Well, you are incredible players! There are no more moves left:\n"
  
  # Sets up the text output.
  #
  # delay - Default delay for certain outputs.
  # field - The current game field.
  def initialize(delay = 1, field)
    # Getting the game rules.
	@delay = delay
    @field = field
	
  end
  
  # Shows the initial game text.
  def show_game_setup
    puts TEXT_GAME_SETUP
    sleep(@delay)
  end
  
  # Shows the request input for players name text.
  #
  # symbol - represents the players specific ingame symbol.
  def show_enter_player(symbol)	
    output_text = String.new(TEXT_ENTER_PLAYER)
	output_text['{player_symbol}'] = symbol
	puts output_text
  end
  
  # Shows the text after a players name is entered.
  #
  # name - The players name.
  # symbol - The players specific ingame symbol.
  def show_thanks_player(name, symbol)
    output_text = String.new(TEXT_THANKS_PLAYER)
    output_text['{player_name}'] = name
	output_text['{player_symbol}'] = symbol
	
	puts output_text
    sleep(@delay)
  end
  
  # Shows the game initiation text.
  def show_game_start
    puts TEXT_GAME_START
    sleep(@delay * 2)
  end
  
  # Shows the text for the next game turn.
  #
  # player - The active players name.
  def show_next_turn(name)
    output_text = String.new(TEXT_NEXT_TURN)
    output_text['{player_name}'] = name
	
	self.show_empty_row
    self.show_lines
    sleep(@delay)
    
	self.show_empty_row
    sleep(@delay)
    
	puts output_text
  end

  # Shows the lines of the game field.
  def show_lines
    puts TEXT_LINES_HEADLINE
    
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
  
  # Shows the text for the next game turn.
  #
  # player - The active players name.
  def show_winner_information(name)
    output_text = String.new(TEXT_WINNER_INFORMATION)
    output_text['{player_name}'] = name
	
    sleep(@delay)
    puts output_text
  end
  
  # Shows the text if there are no more moves left.
  def show_no_more_moves
    puts TEXT_NO_MORE_MOVES
	self.show_lines
  end
  
  
  # Shows an empty row.
  def show_empty_row
    puts ""
  end
  
end