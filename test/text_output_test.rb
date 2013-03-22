 require_relative 'test_helper'
require 'minitest/autorun'

require 'text_output'
require 'field'

## Minitest for ConnectFour
#
# 2013 René Wernicke

class TextOutputTest < ConnectFourSpec
  
  # Is the text output created correctly?
  def test_create_text_output
    field_fivefive = Field.new(5, 5)
	
	text_out = TextOutput.new(1, field_fivefive)
	
	assert_equal(field_fivefive, text_out.field)
	assert_equal(1, text_out.delay)

  end

  # Is the text output created correctly?
  def test_show_game_setup
    field_fivefive = Field.new(5, 5)
	
	text_out = TextOutput.new(1, field_fivefive)
	
	# Perhaps: Adding the expected text...
	assert_output { text_out.show_game_setup }
  end
  
  # Is the text output created correctly?
  def test_show_enter_player
    field_fivefive = Field.new(5, 5)
	
	text_out = TextOutput.new(1, field_fivefive)
	
	# Perhaps: Adding the expected text...
	assert_output { text_out.show_enter_player("Test") }
  end
  
  # Is the text output created correctly?
  def test_show_thanks_player
    field_fivefive = Field.new(5, 5)
	
	text_out = TextOutput.new(1, field_fivefive)
	
	# Perhaps: Adding the expected text...
	assert_output { text_out.show_thanks_player("Playername", "PlayerSymbol") }
  end
  
  # Is the text output created correctly?
  def test_show_game_start
    field_fivefive = Field.new(5, 5)
	
	text_out = TextOutput.new(1, field_fivefive)
	
	# Perhaps: Adding the expected text...
	assert_output { text_out.show_game_start }
  end

  # Is the text output created correctly?
  def test_show_next_turn
    field_fivefive = Field.new(5, 5)
	
	text_out = TextOutput.new(1, field_fivefive)
	
	# Perhaps: Adding the expected text...
	assert_output { text_out.show_next_turn("Player") }
  end
  
  # Is the text output created correctly?
  def test_show_lines
    field_fivefive = Field.new(1, 1)
	field_fivefive.assignment = Array.new
	field_fivefive.assignment[0] = Array.new
	field_fivefive.assignment[0][0] = true
	
	
	text_out = TextOutput.new(1, field_fivefive)
	
	# Perhaps: Adding the expected text...
	assert_output() { text_out.show_lines }
  end
  
  # Is the text output created correctly?
  def test_show_empty_row
    field_fivefive = Field.new(5, 5)
	
	text_out = TextOutput.new(1, field_fivefive)
	
	# Special: There seems to be just one correct output.
	assert_output("\n") { text_out.show_empty_row }
  end
end