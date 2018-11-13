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

  def each
    for todo in @todos
      yield(todo)
    end
  end

  private

  def raise_exception_unless_index_exists(idx)
    raise ArgumentError if idx.nil?
    raise IndexError if idx > @todos.length - 1
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end