require 'test_helper'
require 'field'

class FieldTest < ConnectFourSpec

  def setup
    @field = Field.new
  end

  def teardown
    @field = nil
  end

  def test_create_field_with_defaults
    assert_field_size @field, 6, 7
  end

  def test_change_field_size
    @field.width  = 5
    @field.height = 10
    assert_field_size @field, 5, 10
  end

  def test_assignment
    empty_assign = Array.new @field.width
    @field.width.times { |x| empty_assign[x] = Array.new @field.height }
      
    assert_equal(empty_assign, @field.assignment)
  end
  
  def test_inserted_token?

    # Filling first line with Player X values
    @field.height.times { @field.token_inserted?(1, true) }
    
    # Testing filled first row.
    @field.height.times do |y| 
      assert_equal true, @field.assignment[0][y - 1]
    end
  
    # testing the empty rows (x + 1)
    (@field.width - 1).times do |x|
      @field.height.times do |y| 
        if (x == 0)
          assert_equal(true, @field.assignment[x][y - 1])
        else
          assert_equal(nil, @field.assignment[x][y - 1])
        end
      end
    end
  
    # testing column overflow - first row.
    refute_equal true, @field.token_inserted?(1, true)
    # aasdasd

    # testing column overflow - other rows.
    (@field.width - 1).times do |x|
      assert_equal(false, @field.token_inserted?(1, true))
    end
  end
  
  def test_is_playable?
    assert_equal true, @field.is_playable?
  
    # filling the empty @field with values.
    @field.width.times do |x|
      @field.height.times do |y|
        @field.token_inserted? x, true
      end
    end
    refute_equal true, @field.is_playable?
  end
  
  def test_has_winner?
    # Empty @field should have no winner.
    refute_equal true, @field.has_winner?

    # @field filled with x should return ALWAYS a winner.
    field_filled_x = Field.new
    @field.width.times do |x|
      @field.height.times do
        field_filled_x.token_inserted?(x, true)
      end
    end
    assert_equal(true, field_filled_x.has_winner?)
  end
end