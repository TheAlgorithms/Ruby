# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    return s.length if s.length <= 1
    
    longest_length, pointer1, pointer2 = 0, 0, 1
    
    while s[pointer2]
      cur_substring = s[pointer1..pointer2]
      if cur_substring.split('').uniq.join('') == cur_substring
        longest_length = [longest_length, cur_substring.length].max
        pointer2 += 1
      else
        pointer1 += 1
      end
    end
    
    longest_length
end