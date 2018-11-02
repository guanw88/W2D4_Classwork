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

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
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

  def push(el)
    @store.push(el)
  end

  def pop
    @store.pop
  end

end
