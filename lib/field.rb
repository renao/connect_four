## ConnectFour -- Beispielprojekt --
# 
# Represents the connect four game field.
#
# 2013 Rene Wernicke

class Field
  include Comparable
  
  # The fields height.
  attr_accessor :height
  
  # The fields width.
  attr_accessor :width
  
  # The last inserted token
  @last_insert_x
  @last_insert_y
  
  # Represents the fields assignment in the active game as a 2D array [x][y].
  #
  # Possible values:
  #
  # nil - spot is free.
  # true - spot is assigned by player X.
  # false - spot is assigned by player O.
  attr_accessor :assignment
  
  
  # Creates the Field.
  #
  # width - the width of the created field.
  # height - the height of the created field.
  def initialize(width = 6, height = 7)
    @width = width
    @height = height	
	
	@last_insert_x = 0
	@last_insert_y = 0
  
    @assignment = Array.new width

    width.times do |x|
      @assignment[x] = Array.new height
    end
  end

  # Returns if there is still room to move.
  #
  # Returns TRUE, if the field is not filled completely.
  def is_playable?
    is_playable = false
    x = 0
    while ((x < self.width) && (!is_playable))
      is_playable = (@assignment[x][0] == nil);
	  x += 1
    end
    is_playable
  end
  
  # Puts a new token into the field.
  #
  # column - the columns number of the token.
  # player - the player, that inserts the token.
  #
  # Returns TRUE: If the token is inserted correctly.
  def token_inserted?(column, player)    
    is_inserted = false
    y = 0
    
    # Is the column already filled completely?
    if (@assignment[column - 1][0] != nil)
      is_inserted = false
    # If there is some room, put it into the spot at its top.
    else
      while ((@assignment[column - 1][y] == nil) &&(y < self.height))
        y += 1
      end
      @assignment[column - 1][y - 1] = player
      
    @last_insert_x = column
    @last_insert_y = y
    
    is_inserted = true
    end
    is_inserted
  end
  
  # Adds support for equality.
  def <=>(second_field)
    (height <=> second_field.height) && (@width <=> second_field.width) && (@assignment <=> second_field.assignment)
  end
  
  # Tells if the field has a winner.
  #
  # Return: TRUE if there is a winner.
  def has_winner?
    check_for_winner
  end
  
  private
  
  # Checks if the last inserted token made a winner.
  #
  # Returns true if the last insertion returned a winner.
  def check_for_winner
    check_column || check_row
  end
   
  # Checks if the last insertion made a winner in horizontal.
  #
  # Returns true if last move made a winner.
  def check_row
    count = 0
	puts @last_insert_x
	# Get the players symbol.
	player_symbol = assignment[@last_insert_x - 1][@last_insert_y - 1]
	next_symbol = player_symbol
	
	i = @last_insert_x
	
	# Go to the left of the row.
	while (i >= 1) && (next_symbol == player_symbol)
	  i -= 1
	  count += 1
	  next_symbol = assignment[i - 1][@last_insert_y - 1]
        
	end
	
	# And now, go to the right - if possible.
	if @last_insert_x < width
	  i = @last_insert_x
	
	  next_symbol = assignment[i - 1][@last_insert_y - 1]
		
	  while (i < width) && (next_symbol == player_symbol)
	    count += 1
		i += 1
	    next_symbol = assignment[i - 1][@last_insert_y - 1]
        
	  end
	
	end
	
	count >= 4
	
  end
  
  # Checks if the last insertion made a winner in vertical.
  #
  # Returns true if there is a winner.
  def check_column
    count = 0
	
	# Get the players symbol.
	player_symbol = assignment[@last_insert_x - 1][@last_insert_y - 1]
	next_symbol = player_symbol
	
	i = @last_insert_y
	
	# Go to the bottom of the column.
	while (i <= height) && (next_symbol == player_symbol)
	  i += 1
	  count += 1
	  next_symbol = assignment[@last_insert_x - 1][i - 1]
        
	end
	
	count >= 4
  end
end