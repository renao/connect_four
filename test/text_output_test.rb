require 'test_helper'
require 'field'
require 'text_output'

class TextOutputTest < ConnectFourSpec


  def setup
    @field = Field.new(5, 5)
    @text_output = TextOutput.new(1, @field)
  end

  def teardown
    @field = nil
    @text_output = nil
  end

  def test_init
    assert_equal @field, @text_output.field
    assert_equal 1, @text_output.delay
  end

  def test_show_game_setup
    assert_output("ConnectFour - neopoly GmbH\n2013 Rene Wernicke\n\nLet's play a game of ConnectFour!\n") { @text_output.show_game_setup }
  end

  def test_show_enter_player
    assert_output("\nPlayer X: Please enter your name:\n") { @text_output.show_enter_player("X") }
  end

  def test_show_thanks_player
    assert_output("Thank you, Test - Your symbol will be X.\n") { @text_output.show_thanks_player("Test", "X") }
  end

  def test_show_game_start
    assert_output("\nThe game starts now - enjoy!\n") { @text_output.show_game_start }
  end

  def test_show_lines
    assert_output() { @text_output.show_lines }
  end

  def test_show_empty_row
    assert_output("\n") { @text_output.show_empty_row }
  end

end