require 'pry-byebug'

def reduce(array, default_value = 0)
  accum = default_value
  accum_array = [] 

  for item in array
    accum_array << yield(accum, item)
    accum = 0
  end

  accum_array.sum
end



array = [1, 2, 3, 4, 5]

puts reduce(array) { |acc, num| acc + num } == 15 
puts reduce(array, 10) { |acc, num| acc + num }  == 25
# reduce(array) { |acc, num| acc + num if num.odd? }
