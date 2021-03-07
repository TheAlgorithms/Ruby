# Given a number, calculates the fibonacci number.

def fibonacci(number, memo_hash = {})
    if number == 0 || number == 1
        return number
    end
    memo_hash[number] ||= fibonacci(number - 1, memo_hash) + fibonacci(number -2, memo_hash)
end