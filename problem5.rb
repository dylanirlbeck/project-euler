# typed: strict

=begin
2520 is the smallest number that can be divided by 
each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly 
divisible by all of the numbers from 1 to 20?
=end

require 'sorbet-runtime'
extend T::Sig

# TODO: Optimize by pre-generating the numbers to test, consolidating based on
# primes.
sig {params(num: Integer, limit: Integer).returns(T::Boolean)}
def is_evenly_divisible(num, limit)
  (1..limit).to_a.select {|i| num % i == 0}.length == limit
end

smallest = 2520
while !is_evenly_divisible(smallest, 20) do
  smallest += 2520
  puts smallest
end

puts smallest
