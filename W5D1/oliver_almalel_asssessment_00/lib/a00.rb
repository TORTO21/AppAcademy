# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

# def caesar_cipher(str, shift)
#   cipher = str.split
#   p cipher
#   cipher.map { |word| caesar_cipher_word(word, shift) }

  
# end

def caesar_cipher(str, shift)
  caesar = str.split
  caesar.map { |word| caesar_cipher_word(word, shift) }.join(" ")
end

def caesar_cipher_word(str, shift)
  alpha = ("a".."z").to_a
  caesar = ""
  str.each_char { |char| caesar += alpha[(alpha.index(char) + shift) % 26] }
  caesar
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

# Example:
# digital_root(4322) => digital_root(11) => (2)

def digital_root(num)
  while num > 10
    num = num.digits.sum
  end  
  num
end  

def digital_root_recursive(num)
  return num if num < 10
  digital_root_recursive(num.digits.sum)
end

def digital_root_soln(num)  #code by Mashu Duek
  while num > 10
    num = digital_root_step(num)
  end
  num
end

def digital_root_step(num)
  root = 0
  while num > 0
    root += (num % 10)
    num /= 10
  end
  root
end
# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  alpha = (alphabet || ("a".."z").to_a)
  sorted = false
  while !sorted
    sorted = true

    (0...str.length - 1).each do |i|
      if alpha.index(str[i]) > alpha.index(str[i + 1])
        str[i], str[i + 1] = str[i + 1], str[i]
        sorted = false
      end
    end
  end
  str
end

# p jumble_sort("hello") #=> "ehllo"
# p jumble_sort("hello", ['o', 'l', 'h', 'e']) # => 'ollhe'

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    new_arr = []
    self.each_with_index do |el1, i1|
      self.each_with_index do |el2, i2|
        if i2 > i1 && (el1 + el2 == 0)
          new_arr << [i1, i2].sort
        end
      end
    end
    new_arr.sort
  end

end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    words = []
    (0...self.length - 1).each do |start_idx|
      (start_idx..length - 1).each do |end_idx|
        section = self[start_idx..end_idx] 
        words << section if dictionary.include?(section) && !words.include?(section)
      end
    end
    words

  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  (1..num).to_a.select { |ele| num % ele == 0 }
end
