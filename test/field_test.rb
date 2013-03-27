require_relative 'test_helper'
require 'minitest/autorun'
require 'field'

## Minitest for ConnectFour
#
# 2013 René Wernicke

class FieldTest < ConnectFourSpec
  
  # Is the field created correctly?
  def test_create_field
    field = Field.new
    
  # Testing defaults
  assert_equal 6, field.width
  assert_equal 7, field.height
  
  
  # Changing values
  field.height = 10
  field.width = 5
  
  assert_equal 10, field.height
  assert_equal 5, field.width
  
  assert_equal Field.new, Field.new
  
  end

  def test_assignment
    field = Field.new
  
  empty_assign = Array.new field.width
  field.width.times { |x| empty_assign[x] = Array.new field.height }
    
  assert_equal(empty_assign, field.assignment)
  end
  
  def test_inserted_token?
  
  field = Field.new
 
  # Filling first line with Player X values
  field.height.times { field.token_inserted?(1, true) }
  
  # Testing filled first row.
  field.height.times do |y| 
    assert_equal true, field.assignment[0][y - 1]
  end
  
  # testing the empty rows (x + 1)
  (field.width - 1).times do |x|
    field.height.times do |y| 
      if (x == 0) 
	    assert_equal(true, field.assignment[x][y - 1])
      else
	    assert_equal(nil, field.assignment[x][y - 1])
	  end
    end
  end
  
  # testing column overflow - first row.
  refute_equal true, field.token_inserted?(1, true)
  
  # testing column overflow - other rows.
  (field.width - 1).times do |x|
    assert_equal(false, field.token_inserted?(1, true))
  end
  
  end
  
  def test_is_playable?
    empty_field = Field.new
      
    assert_equal true, empty_field.is_playable?
	
	# filling the field with values.
	empty_field.width.times do |x|
	  empty_field.height.times do |y|
	    empty_field.token_inserted? x, true
	  end
	end
  
	refute_equal true, empty_field.is_playable?
  
  
  end
  
  def test_has_winner?
    field = Field.new
	
    # Empty field should have no winner.
    refute_equal true, field.has_winner?
	
    # Field filled with x should return ALWAYS a winner.
	field_filled_x = Field.new
	
	field.width.times do |x|
	  field.height.times do
	    field_filled_x.token_inserted?(x, true)
	  end
	end
	
	assert_equal(true, field_filled_x.has_winner?)
  
  end
  
end