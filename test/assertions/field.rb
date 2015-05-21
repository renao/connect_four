module Assertions

  def assert_field_size(field, width, height)
    assert_equal width,  field.width, "Invalid field width (Expected: #{width}, Current: #{field.width}"
    assert_equal height, field.height, "Invalid field height (Expected: #{height}, Current: #{field.height}"
  end

end