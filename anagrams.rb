def first_anagram?(first_word, second_word) # O(n!) time complexity
  permutations = first_word.split("").permutation.to_a
  permutations.map! {|el| el.join("")}
  permutations.include?(second_word) ? true : false
end

# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")

def second_anagram?(first_word, second_word) #O(n^2)
  letters_word_one, letters_word_two = first_word.split(""), second_word.split("")
  letters_word_one.each_with_index do |letter, idx|
    letter_pos = letters_word_two.find_index(letter)
    return false if letter_pos.nil?
    letters_word_two.delete_at(letter_pos)
  end
  return true if letters_word_two.empty?
  false
end

# p second_anagram?("gizmo", "sally")
# p second_anagram?("elvis", "lives")

def third_anagram?(first_word, second_word) #O(n^2) but prob O(N logN)
  letters_word_one, letters_word_two = first_word.split(""), second_word.split("")
  return letters_word_one.sort == letters_word_two.sort
end

# p third_anagram?("gizmo", "sally")
# p third_anagram?("elvis", "lives")

def fourth_anagram?(first_word, second_word) #O(n)
  letter_hash = Hash.new(0)
  first_word.each_char do |letter|
    letter_hash[letter] += 1
  end
  second_word.each_char do |letter|
    return false unless letter_hash.has_key?(letter) #optimization
    letter_hash[letter] -= 1
    return false if letter_hash[letter] < 0 #optimization
  end
  return true if letter_hash.values.all?{ |value| value == 0 }
  return false
end

p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")
