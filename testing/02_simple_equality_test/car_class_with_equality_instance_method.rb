require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
  
  def ==(other)
    other.is_a?(Car) && name == other.name
  end
end

class CarTest < MiniTest::Test
  def setup
    @car1 = Car.new
    @car2 = Car.new
  end

  def test_equality
    assert_equal(@car1, @car2)
  end

  def test_not_same_objects
    refute_same(@car1, @car2)
  end 
end