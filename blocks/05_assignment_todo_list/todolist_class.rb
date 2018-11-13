require_relative 'todo_class'
# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.
class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(new_todo)
    raise TypeError, 'Can only add Todo objects' unless new_todo.is_a? Todo

    @todos << new_todo
  end

  def size
    @todos.length
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index)
    raise_exception_unless_index_exists(index)

    @todos[index]
  end

  def mark_done_at(index)
    raise_exception_unless_index_exists(index)

    @todos[index].done!
  end

  def mark_undone_at(index)
    raise_exception_unless_index_exists(index)

    @todos[index].undone!
  end

  def shift
    @todos.delete_at(0)
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    raise_exception_unless_index_exists(index)

    @todos.delete_at(index)
  end

  def to_s
    puts "---- Today's Todos ----"
    @todos.each { |todo| puts todo.to_s }
  end

  private

  def raise_exception_unless_index_exists(idx)
    raise ArgumentError if idx.nil?
    raise IndexError if idx > @todos.length - 1
  end
end

# given
todo1 = Todo.new('Buy milk')
todo2 = Todo.new('Clean room')
todo3 = Todo.new('Go to gym')
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
#list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# # <<
# # same behavior as add

# # ---- Interrogating the list -----

# size
# list.size                       # returns 3

# first
# list.first                      # returns todo1, which is the first item in the list

# last
# list.last                       # returns todo3, which is the last item in the list

# # ---- Retrieving an item in the list ----

# # item_at
# list.item_at                    # raises ArgumentError
# list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,

# list.mark_undone_at(100)        # raises IndexError

# # ---- Deleting from the list -----

# # shift
# puts list.shift                      # removes and returns the first item in list

# # # pop
# puts list.pop                        # removes and returns the last item in list

# # remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# # to_s
# list.to_s                      # returns string representation of the list

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym
