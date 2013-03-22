## ConnectFour -- Beispielprojekt --
# 
# Receives the text inputs for the game of ConnectFour.
#
# 2013 René Wernicke

class TextInput
  
  # The maximum width of the games field.
  @max_width
  
  # Sets up the text input controller.
  def initialize(max_width)
    @max_width = max_width
  end
  
  # Gets the non-validated name entry.
  #
  # RETURN players name.
  def get_player_name
    name = STDIN.gets.chomp
    name
  end
  
  # Gets a validated column entry.
  #
  # Returns column number.
  def get_column
  column = 0
  column = STDIN.gets.chomp
  # Validation - if it fails, try input again
  (column_valid? column) ? column : (self.get_column)
  end
  
  private
  # Validates the input to be an integer within the width of the games tableau.
  def column_valid?(column)
  is_valid = true
    if ((column.to_i < 1) || (column.to_i > @max_width))
      puts "Well, there went something wrong with your input: #{column}. Please try again:"
      is_valid = false
    end
  is_valid
  end
  
end