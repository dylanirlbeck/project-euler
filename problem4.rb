# typed: strict

=begin
A palindromic number reads the same both ways. The largest 
palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=end

require 'sorbet-runtime'
extend T::Sig

sig { params(num: Integer).returns(T::Boolean) }
def is_palindromic(num)
  num.to_s == num.to_s.reverse
end

SMALLEST = 10000
LARGEST = 998001

largest_palindrome = 1
for num in T.let((SMALLEST..LARGEST).to_a.reverse, T::Array[Integer]) do
  found = T.let(false, T::Boolean)
  if is_palindromic(num) then
    # If the number is a palindrome, we need to find its factors.
    for i in (100..999) do
      remainder = num / i
      if remainder.to_s.length == 3 && num % i == 0 then
        largest_palindrome = num
        found = true
        break
      end
    end
  end

  break if found
end

puts largest_palindrome
