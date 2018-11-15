require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_same(@todo1, @list.shift)
    assert_equal(2, @list.size)
  end

  def test_pop
    assert_same(@todo3, @list.pop)
    assert_equal(2, @list.size)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_can_only_add_todo
    assert_raises(TypeError) { @list << String.new('Hello!') }
  end

  def test_can_add_to_list
    @list << Todo.new("Buy beer!")
    assert_equal(4, @list.size)
  end

  def test_add_and_shovel_are_aliased
    @list.add Todo.new("Buy beer!")
    assert_equal(4, @list.size)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(0)
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(0)
    refute_includes(@list, @todo1)
  end

  def test_to_s
    output = <<~HEREDOC.chomp
      ---- Today's Todos ----
      [ ] Buy milk
      [ ] Clean room
      [ ] Go to gym
    HEREDOC

    assert_equal(output, @list.to_s)
  end

  def test_one_done
    @list.mark_done_at(1)

    output = <<~HEREDOC.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    HEREDOC

    assert_equal(output, @list.to_s)
  end

  def test_all_done
    @list.done!

    output = <<~HEREDOC.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    HEREDOC

    assert_equal(output, @list.to_s)
  end

  def test_each_works
    new_list = []
    @list.each { |todo| new_list << todo }

    assert_equal(new_list, @list.to_a )  
  end

  def test_returns_original_obj
    rtn_obj = @list.each { |_| 'hello!' }

    assert_same(@list, rtn_obj)
  end

  def test_select
    rtn_obj = []

    rtn_obj = @list.select { |todo| todo.title == "Buy milk" }
    assert_instance_of(TodoList, rtn_obj)
    assert_includes(rtn_obj, @todo1)
  end
end
