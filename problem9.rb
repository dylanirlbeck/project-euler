# typed: strict

=begin
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc
=end

require 'sorbet-runtime'
extend T::Sig

sig {
  params(
    a: Integer,
    b: Integer,
    c: Integer
  ).returns(T::Boolean)
}
def is_triplet(a, b, c)
  a**2 + b**2 == c**2
end

# The max of c is 1000
# If we do a brute force it'd be O(1000**3)
# However, we're further limited by the fact that 
# c == b + a
# 1000 == b + a
# 900 == 50 + 50
# 700 == 200 + 100
# Search space for c is between 400 and 700, realistically.

for c in (400..700) do
  b = 1000 - c
  while b > 0 do
    a = 1000 - b - c
    while a > 0 do
      puts a * b * c if is_triplet(a, b, c) && a + b + c === 1000
      puts a, b, c if is_triplet(a, b, c) && a + b + c === 1000
      a -= 1
    end
    b -= 1
  end
end
