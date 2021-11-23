# typed: strict

=begin
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
=end

# Find largest prime factor
primes = Array.new(2_000_000, true)

# Run Sieve of Eratosthenes to generate primes
i = 2
ret = 2
sum = 0
for i in (2..primes.length)
  if primes[i]
    sum += i
    j = Integer(i**2)
    while j < primes.length
      primes[j] = false
      j += i
    end
  end
end

puts sum
