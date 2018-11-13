def select(array)
  counter = 0
  rtn_ary = []

  for i in array
    rtn_val = yield i
    rtn_ary << i if rtn_val 
  end

  rtn_ary
end

array = [1, 2, 3, 4, 5]

rtn_val = select(array) { |ele| ele.even? } # => [2, 4]
print rtn_val
puts

rtn_val = select(array) { |num| num.odd? }  # => [1, 3, 5]
print rtn_val
puts

rtn_val = select(array) { |num| puts num }  # => [], because "puts num" returns nil and evaluates to false
print rtn_val
puts

rtn_val = select(array) { |num| num + 1 }   # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
print rtn_val
puts