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

extension ListNode {
    // Deep copy
    func copy(with zone: NSZone? = nil) -> Any {
        return ListNode(self.val, self.next)
    }
}

class Solution {
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        /// node which will be the `next` and was the previous one
        var previousNode: ListNode? = nil
        /// currentNode to modify
        var currentNode: ListNode? = head.copy() as! ListNode
        
        while currentNode != nil {
            var temp = currentNode?.next?.copy() as? ListNode
            currentNode?.next = previousNode?.copy() as? ListNode
            previousNode = currentNode?.copy() as? ListNode
            currentNode = temp?.copy() as? ListNode
        }
        return previousNode
    }
}

// TODO: Implement recursively