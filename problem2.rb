num1 = 1
num2 = 2
even_sum = 0

while num2 < 4000000 do
  even_sum += num2 unless num2 % 2 != 0 

  # Generate new Fibonacci numbers
  new_num = num1 + num2
  num1 = num2
  num2 = new_num
end

puts even_sum