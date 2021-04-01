# Given n pairs of parentheses, write a function to generate all combinations
# of well-formed parentheses.
#
# Example 1:
#
# Input: n = 3
# Output: ["((()))","(()())","(())()","()(())","()()()"]
# Example 2:
#
# Input: n = 1
# Output: ["()"]
#
#
# Constraints:
#
# 1 <= n <= 8

# Approach:
#
# Let's only add '(' or ')' when we know it will remain a valid sequence.
# We can do this by keeping track of the number of opening and closing brackets
# we have placed so far.
#
# We can start an opening bracket if we still have one (of n) left to place.
# And we could start a closing bracket if it'd not exceed the number of opening
# brackets.

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  parenthesis = []
  backtrack(parenthesis, "", 0, 0, n)
  parenthesis
end

def backtrack(parenthesis, curr, open, close, max)
  if curr.length == max * 2
    parenthesis.push(curr)
    return
  end

  if open < max
    backtrack(parenthesis, curr + "(", open + 1, close, max)
  end

  if close < open
    backtrack(parenthesis, curr + ")", open, close + 1, max)
  end
end

n = 3
print(generate_parenthesis(n))
# Output: ["((()))","(()())","(())()","()(())","()()()"]

n = 1
print(generate_parenthesis(n))
# Output: ["()"]
