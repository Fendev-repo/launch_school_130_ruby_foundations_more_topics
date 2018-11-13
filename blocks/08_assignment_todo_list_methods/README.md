# Assignment: TodoList methods

At this point, we should have the following methods:

TodoList Class  Todo Class
size  done!
first done?
last  undone!
shift to_s
pop 
done? 
<< (aliased to add) 
item_at 
mark_done_at  
mark_undone_at  
done! 
remove_at 
to_s  
to_a  
each  
select  

We now want to add a few more methods that can piggy-back off of the TodoList#each and TodoList#select methods. Implement the below methods.

Hint: use either TodoList#each or TodoList#select for the implementation.

TodoList Class  Description
find_by_title takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
all_done  returns new TodoList object containing only the done items
all_not_done  returns new TodoList object containing only the not done items
mark_done takes a string as argument, and marks the first Todo object that matches the argument as done.
mark_all_done mark every todo as done
mark_all_undone mark every todo as not done