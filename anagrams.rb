def first_anagram?(first_word, second_word) # O(n!) time complexity
  permutations = first_word.split("").permutation.to_a
  permutations.map! {|el| el.join("")}
  permutations.include?(second_word) ? true : false
end

p first_anagram?("gizmo", "sally")
p first_anagram?("elvis", "lives")
