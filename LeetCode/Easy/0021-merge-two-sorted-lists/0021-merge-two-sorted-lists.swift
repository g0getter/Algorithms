/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // 1. 첫 번째 listnode끼리 비교, 더 작은 것을 넣고 pointer 옮기기
        // 2. pointer 2개가 null 될 때까지 반복
        var pointer1 = list1
        var pointer2 = list2
        var newListPointer: ListNode?
        
        // newListPointer 채우기
        var smallerListNode: ListNode?
        
        if list1?.val ?? 101 < list2?.val ?? 101 {
            smallerListNode = list1
            pointer1 = pointer1?.next
        } else {
            smallerListNode = list2
            pointer2 = pointer2?.next
        }
        newListPointer = smallerListNode
        let firstNode = newListPointer
        
        // 근데 메모리에 그대로 올라가 있는건지 새로 할당되는건지 모르겠음 -> 새로 할당할 필요 없음. 그냥 가리키는 것 바꾸면 될듯
        while (pointer1 != nil || pointer2 != nil) {
            if pointer1?.val ?? 101 < pointer2?.val ?? 101 { // 한 쪽이 nil이라면 다른 쪽이 들어가야하므로
                newListPointer?.next = pointer1
                newListPointer = newListPointer?.next
                pointer1 = pointer1?.next
            } else {
                newListPointer?.next = pointer2
                newListPointer = newListPointer?.next
                pointer2 = pointer2?.next
            }
        }
        
        func printAll(_ tag: String) {
            print("---\(tag)---")
            print("[newListPointer] val:\(newListPointer?.val), next: \(newListPointer?.next?.val)")
            print("[pointer1] val:\(pointer1?.val), next: \(pointer1?.next?.val)")
            print("[pointer2] val:\(pointer2?.val), next: \(pointer2?.next?.val)\n")
        }
        
        return firstNode
    }
}