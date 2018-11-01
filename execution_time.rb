#my_min
# Given a list of integers find the smallest number in the list.

#my_min in O(n^2) time complexity
def my_min_1(list)
  smallest = nil
  list.each do |el1|
    smallest = el1 if smallest == nil
    list.each do |el2|
      if el2 < el1 && el2 < smallest
        smallest = el2
      end
    end
  end
  smallest
end

#my_min in O(n) time complexity
def my_min_2(list)
  smallest = list.first
  list.each do |el|
    if el < smallest
      smallest = el
    end
  end
  smallest
end

#Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.
#
# Example:
#
#     list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8
#
#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7

def largest_contiguous_subsum_1(arr)
  possibles = []
  arr.each_with_index do |el1,idx1|
    mini = [el1]
    arr.each_with_index do |el2, idx2|
      if idx2 > idx1
        mini << el2
      end
      possibles << mini.dup
    end
  end
  possibles.map {|el| el.reduce(:+)}.max
end

# list = [-5, -1, -3]
# p largest_contiguous_subsum_1(list)

def largest_contiguous_subsum_2(array)
  largest = nil
  running_tally = nil

  array.each_with_index do |el, i|
    if i == 0
      largest = el
      running_tally = el
    elsif i > 0
      running_tally < 0 ? running_tally = el : running_tally += el
    end
    largest = running_tally if running_tally > largest
  end
  largest
end

list = [5, 3, -7]
p largest_contiguous_subsum_2(list)
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_2(list)
list = [-5, -1, -3]
p largest_contiguous_subsum_2(list)
