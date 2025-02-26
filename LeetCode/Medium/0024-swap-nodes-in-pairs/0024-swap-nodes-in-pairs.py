# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def swapPairs(self, head: Optional[ListNode]) -> Optional[ListNode]:
        # 누구 하나를 기준으로, 걔와 그 다음 노드를 바꿈
        # '누구 하나'를 자신의 다음 노드로 설정하고 다시 호출 (혹은 재귀로 반복)
        # 반환은 swap한 다른 노드.

        if head is None or head.next is None:
            return head
        
        # 1. 앞 2개 swap, 앞의 아이를 return
        origin = head.next # 반환할 것을 따로 빼두고
        nextPart = self.swapPairs(head.next.next) # 결과를 연결할 곳도 빼두고
        head.next.next = head # 뒤에서부터 변경
        head.next = nextPart # 앞의 것 변경
        
        return origin


