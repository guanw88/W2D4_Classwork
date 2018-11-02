require "byebug"

def max_windowed_range(array, window_size) #O(n^2)
  current_max_range = nil
  # byebug
  array.each_with_index do |el, idx|
    if idx + window_size <= array.length
      window = array[idx...idx + window_size]
      range_diff = window.max - window.min
      current_max_range = range_diff if current_max_range.nil?
      if range_diff > current_max_range
        current_max_range = range_diff
      end
    end
  end
  return current_max_range
end

# p max_windowed_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p max_windowed_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p max_windowed_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p max_windowed_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue
  def initialize
    @store = []
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def enqueue(el) # O(1)
    @store.push(el)
  end

  def dequeue # O(n)
    @store.shift
  end

end

class MyStack
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def push(el) # O(1)
    @store.push(el)
  end

  def pop # O(1)
    @store.pop
  end
end

class StackQueue
  # need size, empty?, enqueue, and dequeue methods
  def initialize
    @stack_store = []
  end

  def size
    @stack_store.size
  end

  def empty?
    @stack_store.empty?
  end

  def enqueue(el)
    @stack_store << MyStack.new.push(el)
  end

  def dequeue
    first_stack = @stack_store[0]
    @stack_store.delete_at(0)
    return first_stack.pop
  end

end
