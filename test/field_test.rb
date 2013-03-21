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
	
	# TODO: Tests for assignments.
  end

  def test_assignment
    field = Field.new
	
	empty_assign = Array.new field.width
	field.width.times { |x| empty_assign[x] = Array.new field.height }
    
	assert_equal(empty_assign, field.assignment)
  end
  
  def test_insert_token
	field = Field.new
	
	empty_assign = Array.new field.width
	field.width.times { |x| empty_assign[x] = Array.new field.height }
    
	# Filling first line with Player X values
	field.height.times { field.insert_token(1, true) }
	
	field.height.times do |y| 
	  assert_equal true, field.assignment[0][y - 1]
	end
	
  end
  
end