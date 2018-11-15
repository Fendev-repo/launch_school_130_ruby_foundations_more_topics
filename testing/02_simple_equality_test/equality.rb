require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EqualityTest < Minitest::Test
  def setup
    @str1 = 'hi there'
    @str2 = 'hi there'
  end

  def test_value_equality
    assert_equal(@str1, @str2)
  end

  def test_not_the_same_objects
    refute_same(@str1, @str2)
  end
end