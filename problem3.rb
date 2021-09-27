# typed: strict

=begin
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
=end

# Find largest prime factor
primes = Array.new(Math.sqrt(600_851_475_143).ceil, true)

# Run Sieve of Eratosthenes to generate primes
i = 2
for i in (2..primes.length)
  if primes[i]
    j = Integer(i**2)
    while j < primes.length
      primes[j] = false
      j += i
    end
  end
end

# Loop backwards to find the largest prime factor
index = primes.length - 1
while index > 1
  break if primes[index] && 600_851_475_143 % index == 0
  index -= 1
end

puts index
