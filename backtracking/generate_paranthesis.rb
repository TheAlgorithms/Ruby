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

# Complexity Analysis
#
# Time Complexity: O(4^n/sqrt(n)). Each valid sequence has at most n steps during the backtracking procedure.
# Space Complexity: O(4^n/sqrt(n)), as described above, and using O(n) space to store the sequence.

# Refer to the attached diagram for recursion,
# The numbers next to each node are the counts of left and right parantheses

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  parenthesis = []
  backtrack(parenthesis, '', 0, 0, n)
  parenthesis
end

def backtrack(parenthesis, curr, open, close, max)
  if curr.length == max * 2
    parenthesis.push(curr)
    return
  end

  backtrack(parenthesis, curr + '(', open + 1, close, max) if open < max

  backtrack(parenthesis, curr + ')', open, close + 1, max) if close < open
end

n = 3
print(generate_parenthesis(n))
# Output: ["((()))","(()())","(())()","()(())","()()()"]

# *** Example: n = 3 *** Space after each DFS instance
# backtrack called with  0 0 []
#   backtrack called with ( 1 0 []
#     backtrack called with (( 2 0 []
#       backtrack called with ((( 3 0 []
#         backtrack called with ((() 3 1 []
#           backtrack called with ((()) 3 2 []
#             backtrack called with ((())) 3 3 []
#           backtrack return with ((()) 3 2 ["((()))"]
#         backtrack return with ((() 3 1 ["((()))"]
#       backtrack return with ((( 3 0 ["((()))"]
#       backtrack called with (() 2 1 ["((()))"]
#         backtrack called with (()( 3 1 ["((()))"]
#           backtrack called with (()() 3 2 ["((()))"]
#             backtrack called with (()()) 3 3 ["((()))"]
#           backtrack return with (()() 3 2 ["((()))", "(()())"]
#         backtrack return with (()( 3 1 ["((()))", "(()())"]
#         backtrack called with (()) 2 2 ["((()))", "(()())"]
#           backtrack called with (())( 3 2 ["((()))", "(()())"]
#             backtrack called with (())() 3 3 ["((()))", "(()())"]
#           backtrack return with (())( 3 2 ["((()))", "(()())", "(())()"]
#         backtrack return with (()) 2 2 ["((()))", "(()())", "(())()"]
#       backtrack return with (() 2 1 ["((()))", "(()())", "(())()"]
#     backtrack return with (( 2 0 ["((()))", "(()())", "(())()"]
#     backtrack called with () 1 1 ["((()))", "(()())", "(())()"]
#       backtrack called with ()( 2 1 ["((()))", "(()())", "(())()"]
#         backtrack called with ()(( 3 1 ["((()))", "(()())", "(())()"]
#           backtrack called with ()(() 3 2 ["((()))", "(()())", "(())()"]
#             backtrack called with ()(()) 3 3 ["((()))", "(()())", "(())()"]
#           backtrack return with ()(() 3 2 ["((()))", "(()())", "(())()", "()(())"]
#         backtrack return with ()(( 3 1 ["((()))", "(()())", "(())()", "()(())"]
#         backtrack called with ()() 2 2 ["((()))", "(()())", "(())()", "()(())"]
#           backtrack called with ()()( 3 2 ["((()))", "(()())", "(())()", "()(())"]
#             backtrack called with ()()() 3 3 ["((()))", "(()())", "(())()", "()(())"]
#           backtrack return with ()()( 3 2 ["((()))", "(()())", "(())()", "()(())", "()()()"]
#         backtrack return with ()() 2 2 ["((()))", "(()())", "(())()", "()(())", "()()()"]
#       backtrack return with ()( 2 1 ["((()))", "(()())", "(())()", "()(())", "()()()"]
#     backtrack return with () 1 1 ["((()))", "(()())", "(())()", "()(())", "()()()"]
#   backtrack return with ( 1 0 ["((()))", "(()())", "(())()", "()(())", "()()()"]
# backtrack return with  0 0 ["((()))", "(()())", "(())()", "()(())", "()()()"]

n = 1
print(generate_parenthesis(n))
# Output: ["()"]
