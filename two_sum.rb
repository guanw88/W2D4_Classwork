def bad_two_sum?(arr, target) #brute force O(n^2)
  arr.each_with_index do |el1, ind1|
    arr.each_with_index do |el2, ind2|
      return true if ind1 < ind2 && el1 + el2 == target
    end
  end
  return false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target) # O(n^2) but probably O(n log n)
  arr.sort!
  arr.each_with_index do |el, idx|
    new_arr = arr[0...idx] + arr[idx + 1..-1]
    return true if new_arr.bsearch { |val| val == target - el }
  end
  return false
end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6)  # => should be true
# p okay_two_sum?(arr, 10) # => should be false


def two_sum?(arr, target) # O(n) time complexity
  numbers = Hash.new(0)
  arr.each{ |num| numbers[num] += 1 }
  numbers.each do |k, v|
    new_target = target - k
    numbers[k] -= 1
    return true if numbers.has_key?(new_target) && numbers[new_target] > 0
    numbers[k] += 1
  end
  return false
end

arr = [0, 1, -5, 15, -3, 7]
p two_sum?(arr, 6)  # => should be true
p two_sum?(arr, 10) # => should be false
