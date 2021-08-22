#Given a string s, find the length of the longest substring without repeating characters.

#Example 1:
#Input: s = "abcabcbb"
#Output: 3
#Explanation: The answer is "abc", with the length of 3.

#Example 2:
#Input: s = "bbbbb"
#Output: 1
#Explanation: The answer is "b", with the length of 1.

#Example 3:
#Input: s = "pwwkew"
#Output: 3
#Explanation: The answer is "wke", with the length of 3.
#Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

#Example 4:
#Input: s = ""
#Output: 0

#Constraints:
#0 <= s.length <= 5 * 104
#s consists of English letters, digits, symbols and spaces.




#Two Pointer Approach - O(n) Time - O(1) Space
#Init longest_length = 0, pointer1 = 0, pointer2 = 1
#while s[pointer2], check if the substring from pointer1..pointer2 is all unique chars
#if yes, pointer2++, update longest_length
#if no, pointer1++. 
#Return longest_length         


# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    return s.length if s.length <= 1
    
    longest_length, pointer1, pointer2 = 0, 0, 1
    
    while s[pointer2]
      cur_substring = s[pointer1..pointer2]
      if cur_substring.split('').uniq.join('') == cur_substring
        longest_length = cur_substring.length if cur_substring.length > longest_length
        pointer2 += 1
      else
        pointer1 += 1
      end
    end
    
    longest_length
end
