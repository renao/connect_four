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
	
	# Is there any output?
	assert_output { text_out.show_game_setup }
	# Is it the expected output?
	assert_output(text_out.text_game_setup) { text_out.show_empty_row }
  end
  
  # Is the text output created correctly?
  def test_show_enter_player
    field_fivefive = Field.new(5, 5)
	
	text_out = TextOutput.new(1, field_fivefive)
	
	# Is there any output?
	assert_output { text_out.show_enter_player("Test") }
	
	# Is it the expected output?
	expected_output = String.new(text_out.text_enter_player)
	expected_output['{player_symbol}'] = "X"
	
	assert_output(expected_output) { text_out.show_enter_player("X") }
  end
  
  # Is the text output created correctly?
  def test_show_thanks_player
    field_fivefive = Field.new(5, 5)
	
	text_out = TextOutput.new(1, field_fivefive)
	
	# Is there any output?
	assert_output { text_out.show_thanks_player("Playername", "PlayerSymbol") }
	
	# Is it the expected output?
	expected_output = String.new(text_out.text_thanks_player)
	expected_output['{player_symbol}'] = "X"
	expected_output['{player_name}'] = "Test"
	
	assert_output(expected_output) { text_out.show_thanks_player("Test", "X") }
  end
  
  # Is the text output created correctly?
  def test_show_game_start
    field_fivefive = Field.new(5, 5)
	
	text_out = TextOutput.new(1, field_fivefive)
	
	# Is there any output?
	assert_output { text_out.show_game_start }
	
	# Is it the expected output?
	assert_output(text_out.text_game_start) { text_out.show_game_start }
	
  end

  # Is the text output created correctly?
  def test_show_next_turn
    field_fivefive = Field.new(5, 5)
	
	text_out = TextOutput.new(1, field_fivefive)
	
	# Perhaps: Is there any output?
	assert_output { text_out.show_next_turn("Player") }
	
	# Is it the expected output?
	#expected_output = String.new(text_out.text_show_next_turn)
	#expected_output['{player_name}'] = "Test"
	#expected_output = "/n" + field_fivefive.show_lines  + "/n" + expected_output
	
	#assert_output(expected_output) { text_out.show_next_turn("Test") }
  end
  
  # Is the text output created correctly?
  def test_show_lines
    field_fivefive = Field.new(1, 1)
	field_fivefive.assignment = Array.new
	field_fivefive.assignment[0] = Array.new
	field_fivefive.assignment[0][0] = true
	
	
	text_out = TextOutput.new(1, field_fivefive)
	
	# Is there any output?
	assert_output() { text_out.show_lines }
	
	# Is it the expected Output for 1x1 true
	expected_output = "" + text_out.text_lines_headline + "\n X  \n 1  \n"
	assert_output(expected_output) { text_out.show_lines }
	
  end
  
  # Is the text output created correctly?
  def test_show_empty_row
    field_fivefive = Field.new(5, 5)
	
	text_out = TextOutput.new(1, field_fivefive)
	
	# Special: There seems to be just one correct output.
	assert_output("\n") { text_out.show_empty_row }
  end
  
  # Is the text output created correctly?
  def test_show_no_more_moves
    field_fivefive = Field.new(5, 5)
	
	text_out = TextOutput.new(1, field_fivefive)
	
	# Is there any output?
	assert_output() { text_out.show_no_more_moves }
	
	# Is it the expected Output for 1x1 true
	#expected_output = text_out.text_no_more_moves + text_out.show_lines
	#assert_output(expected_output) { text_out.show_lines }
  end
  
end