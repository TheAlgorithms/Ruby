# Challenge name: Find Common Characters
#
# Given an array A of strings made only from lowercase letters, return a list
# of all characters that show up in all strings within the list
# (including duplicates).  For example, if a character occurs 3 times in all
# strings but not 4 times, you need to include that character three times in
# the final answer.
#
# You may return the answer in any order.
#
# Example 1:
# Input: ["bella","label","roller"]
# Output: ["e","l","l"]
#
# Example 2:
# Input: ["cool","lock","cook"]
# Output: ["c","o"]

#
# Approach 1: Hash
#
# Time Complexity: O(n)
#
def common_characters(arr)
  target_count = arr.count

  hash = Hash.new(0)
  (0...target_count).each do |i|
    arr[i].split('').each do |letter|
      hash[letter] += 1
    end
  end

  result = []
  hash.each do |k, v|
    while v >= target_count
      if v >= target_count
        result << k
        v -= target_count
      end
    end
  end

  result
end

puts common_characters(%w[bella label roller])
# => ["e","l","l"]

puts common_characters(%w[cool lock cook])
# => ["c","o"]
