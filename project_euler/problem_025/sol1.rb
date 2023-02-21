#The Fibonacci sequence is defined by the recurrence relation:
#    Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
#Hence the first 12 terms will be:
#
#    F1 = 1
#    F2 = 1
#    F3 = 2
#    F4 = 3
#    F5 = 5
#    F7 = 13
#    F8 = 21
#    F6 = 8
#    F9 = 34
#    F10 = 55
#    F11 = 89
#    F12 = 144
#
#The 12th term, F12, is the first term to contain three digits.
#What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

def solution(num_digits = 1000)
  #Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
  resultn1 = 1
  resultn2 = 1
  result = 2
  index = 3
  value = true
  while value
    resultn2 = resultn1
    resultn1 = result
    if (resultn1 + resultn2).abs.digits.length < num_digits
      value = true
    else
      value = false
    end
    result = resultn1 + resultn2    
    index += 1
  end
  res = index
end

answer = solution()
p answer
  