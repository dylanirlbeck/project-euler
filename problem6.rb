# typed: strict

require 'sorbet-runtime'
extend T::Sig

sig {params(n: Integer).returns(Integer)}
def sum_of_squares(n)
  (1..n).reduce {|sum, i| sum += i**2}
end

sig {params(n: Integer).returns(Integer)}
def square_of_sum(n)
  sum = (1..n).reduce {|sum, i| sum += i}
  sum ** 2
end

N = 100
puts  square_of_sum(N) - sum_of_squares(N)

