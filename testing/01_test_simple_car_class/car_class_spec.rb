require 'minitest/autorun'
require_relative 'car_class'
require "minitest/reporters"
Minitest::Reporters.use!

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    car.wheels.must_equal 4
  end
end