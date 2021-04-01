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
