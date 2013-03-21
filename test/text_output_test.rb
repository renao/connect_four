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
    field_fivefive = Field.new(5,5)
	
	#text_out = TextOutput.new(1, field_fivefive)
	
	#assert_equal field_fivefive, text_out.field
	#assert equal 1, text_out.delay
	
	# TODO: Tests for assignments.
  end

  # Is the text output created correctly?
  def test_show_game_setup
    #TODO
  end
  
  # Is the text output created correctly?
  def test_show_enter_player
    #TODO
  end
  
  # Is the text output created correctly?
  def test_show_thanks_player
    #TODO
  end
  
  # Is the text output created correctly?
  def test_show_game_start
    #TODO
  end

  # Is the text output created correctly?
  def test_show_next_turn
    #TODO
  end
  
  # Is the text output created correctly?
  def test_show_lines
    #TODO
  end
  
  # Is the text output created correctly?
  def test_show_empty_row
    #TODO
  end
end