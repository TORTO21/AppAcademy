def upcase(str)
  return "" if str.length == 0
  str[0].upcase + upcase(str[1..-1])
end

p upcase("hello world")

def reverse(str)
  return "" if str.length == 0
  reverse(str[1..-1]) + str[0]
end

p reverse("hello world")

def quick_sort(arr)
  return arr if arr.length <= 1
  pivot = [arr[0]]  # or [arr.first]
  left_side = arr[1..-1].select { |el| el < arr[0] }
  right_side = arr[1..-1].select { |el| el >= arr[0] }
  quick_sort(left_side) + pivot + quick_sort(right_side)
end


p quick_sort([2,6,4,1,5])

class Array
  def quick_sort
    return self if self.length <= 0
    pivot_el = self[0]
    left_els = self[1..-1].select { |el| el < pivot_el }
    right_els = self[1..-1].select { |el| el >= pivot_el }
    left_els.quick_sort + [pivot_el] + right_els.quick_sort
  end
end

def factorial(n)
  return 1 if n <= 1

  n *= factorial(n - 1)
end

def alpha_quick_sort(str)

end


class String
  def quick_sort
    self.split("").quick_sort.join
  end
end

# gamma(n) = (n - 1)!

def gamma_fnc(n)
  return 1 if n - 1 == n
  gamma = gamma_fnc()
  n *= gamma
end

def fib_seq(n)   # Not my code
  return 0 if n <= 0
  return 1 if n == 1
  return fib_seq(n - 1) + fib_seq(n - 2)
end

            # fib 5 = 2 + 1 + fib 4 = 2         5
            #  fib 4 = 1 + 1 + fib 3 = 1        3
            #   fib 3 = 1 + 0 + fib 2 = 1       2
            #    fib 2 = 1 + fib 0 = 0          1
            #     fib 1 = 1                     1

p fib_seq(5)
p fib_seq(6)
p fib_seq(7)
p fib_seq(8)

def fib_arr(n)   # not my code
  return [1] if n < 2
  return [1, 1] if n < 3
  arr = fib_arr(n - 1)      # recurses until base case [1, 1] then shovels up the stack
  arr << (arr[n - 2] + arr[n - 3])  # 2 and 3 because index starts at 0
  return arr
end

def range_rec(start, finish)
  return [start] if start + 1 == finish
  range = range_rec(start + 1, finish)
  range.unshift(start)
end

# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# exp(3, 1) = 3 * exp(3, 1 - 1) = 3
# exp(3, 2) = 3 * exp(3, 2 - 1) = 3 * 3 = 9
# exp(3, 3) = 3 * exp(3, 3 - 1) = 3 * (3 * 3) = 27

def exp_rec_1(b, n)
  return 1 if n == 0
  b * exp_rec_1(b, n - 1)
end

# recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

# exp(3, 0) = 1
# exp(3, 1) = 3
# exp(3, 2) = exp(3, 2 / 2) ** 2 = 3 ** 2 = 9
# exp(3, 4) = exp(3, 4 / 2) ** 2 = (3 ** 2) ** 2 = 81
# exp(3, 3) = 3 * (exp(3, (3 - 1) / 2) ** 2) = 3 * (3 ** 2) = 27
# exp(3, 5) = 3 * (exp(3, (5 - 1) / 2) ** 2) = 3 * (9 ** 2) = 243


def exp_rec_2(b, n)
  return 1 if n == 0
  return b if n == 1
  return exp_rec_2(b, n / 2) ** 2 if n.even?
  return b * (exp_rec_2(b, (n - 1) / 2) ** 2) if n.odd?
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

class Array
  def deep_dup
    
    dup_arr = []
    self.each do |el|
      if !el.is_a?(Array)
        dup_arr << el
      else
        dup_arr << el.deep_dup
    end
    dup_arr
  end
end