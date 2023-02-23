#Problem 14: https://projecteuler.net/problem=14

#Problem Statement:
#The following iterative sequence is defined for the set of positive integers:
#
#    n → n/2 (n is even)
#    n → 3n + 1 (n is odd)
#
#Using the rule above and starting with 13, we generate the following sequence:
#
#    13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#
#It can be seen that this sequence (starting at 13 and finishing at 1) contains
#10 terms. Although it has not been proved yet (Collatz Problem), it is thought
#that all starting numbers finish at 1.

#Which starting number, under one million, produces the longest chain?

def solution()
  index_best_result = 0
  for num in 2..1000000
    index_candidate = 0
    n = num
    while n > 1
      if n%2 == 0
        n = n / 2
      else
        n = (3*n) + 1
      end
      index_candidate +=1
    end
    if index_best_result < index_candidate
      index_best_result = index_candidate
      value = num
    end
  end
  result = value
end

answer = solution()
p answer