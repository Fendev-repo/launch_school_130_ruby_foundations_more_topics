# Assignment: Build a 'select' method

Write a select method that mirrors the behavior of Array#select. 
Note that the Array#select method takes a block, then yields 
each element to the block. If the block evaluates to true, the 
current element will be included in the returned array. If the 
block evaluates to false, the current element will not be included 
in the returned array.