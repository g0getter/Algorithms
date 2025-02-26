# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def addTwoNumbers(self, l1, l2):
        # 1. sum two -> /10: carry, %10: new node
        # 2. previousNode.next = the new node
        # 3. previousNode = the new node
        head = None
        previousNode = None
        carry = 0

        while l1 != None or l2 != None or carry != 0:
            # value = (carry + l1.val + l2.val) % 10
            # carry = (carry + l1.val + l2.val) // 10
            val1 = l1.val if l1 is not None else 0
            val2 = l2.val if l2 is not None else 0
            
            total = val1 + val2 + carry
            value = total % 10
            carry = total // 10

            currentNode = ListNode(value)

            if previousNode is None:
                head = currentNode
            else:
                previousNode.next = currentNode

            previousNode = currentNode # 헷갈림. 값 복사인지 레퍼런스 복사인지
            
            l1 = l1.next if l1 is not None else None
            l2 = l2.next if l2 is not None else None

        return head
        