#typed: strict

=begin
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
we can see that the 6th prime is 13.

What is the 10 001st prime number?
=end

# Find largest prime factor
primes = Array.new(Math.sqrt(600_851_475_143).ceil, true)

# Run Sieve of Eratosthenes to generate primes
i = 2
num_primes = 0
ret = 2
for i in (2..primes.length)
  if primes[i]
    num_primes += 1
    j = Integer(i**2)
    while j < primes.length
      primes[j] = false
      j += i
    end
  end

  if (num_primes == 10001) then
    ret = i
    break
  end
end

puts ret
