# typed: strict

=begin
The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.

Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?
=end

require 'sorbet-runtime'
extend T::Sig

NUM_INT = T.let('731671765313306249192251196744265747423553491949349698352031277450632623957831801698480186947885184385861560789112949495459501737958331952853208805511125406987471585238630507156932909632952274430435576689664895044524452316173185640309871112172238311362229893423380308135336276614282806444486645238749303589072962904915604407723907138105158593079608667017242712188399879790879227492190169972088809377665727333001053367881220235421809751254540594752243525849077116705560136048395864467063244157221553975369781797784617406495514929086256932197846862248283972241375657056057490261407972968652414535100474821663704844031998900088952434506585412275886668811642717147992444292823086346567481391912316282458617866458359124566529476545682848912883142607690042242190226710556263211111093705442175069416589604080719840385096245544436298123098787992724428490918884580156166097919133875499200524063689912560717606058861164671094050775410022569831552000559357297257163626956188267042825248360082325753042075296345l'.to_i, Integer)
NUM = T.let(NUM_INT.to_s, String)

# Take a sliding window approach
left_bound = 0
right_bound = 1
current_product = NUM[0].to_i
max_product = 0
max_substring = T.let("", String)
NUM_ADJACENT = 13

while right_bound < NUM.length do
  puts NUM[left_bound..right_bound]
  if NUM[right_bound] == '0' then
    # Need to reset
    left_bound = right_bound + 1
    right_bound = left_bound
    current_product = NUM[left_bound].to_i
  elsif (right_bound - left_bound + 1 < NUM_ADJACENT)
      # If our window hasn't slid too far, try to expand it.
      right_bound += 1
      current_product *= NUM[right_bound].to_i
  else
      # If our window has slid too far, contract it
      current_product /= NUM[left_bound].to_i
      left_bound += 1 
  end

  if current_product > max_product then
    max_product = T.let(current_product, Integer)
    max_substring = T.let(NUM[left_bound..right_bound], T.nilable(String))
  end
end

puts "Max product: #{max_product}"
puts "Max substring: #{max_substring}"
