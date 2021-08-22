#Given the head of a singly linked list, reverse the list, and return the reversed list.

#Example 1:
#Input: head = [1,2,3,4,5]
#Output: [5,4,3,2,1]

#Example 2:
#Input: head = [1,2]
#Output: [2,1]

#Example 3:
#Input: head = []
#Output: []

#Constraints:
#The number of nodes in the list is the range [0, 5000].
#-5000 <= Node.val <= 5000




#Basic Programming - O(n) Time - O(1) Space
#Init current as head, previous as nil.
#while current != nil: 
#temp = current.next -> current.next = previous -> previous = current -> current = tmp. 
#Return previous (tail of the original linked list, but head of the new one)					


# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
    current = head
    prev = nil
    
    while current
      temp = current.next
      current.next = prev
      prev = current
      current = temp
    end
    
    prev
end
