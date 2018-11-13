# Assignment: Build a 'reduce' method

In this assignment, let's implement a reduce method, similar 
to Enumerable#reduce. Before we do so, let's get (re-)acquainted 
with the Enumerable#reduce method. reduce is another name for the 
inject method, and its main goal is to "fold" or "accumulate" a 
collection into 1 object. What the specific folding or accumulation 
mechanism is depends on the code passed in to the block. Let's take 
the typical example and sum up an array of integers.