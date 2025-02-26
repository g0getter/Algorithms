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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var firstResultNode: ListNode? = nil

        var firstNode: ListNode? = l1
        var secondNode: ListNode? = l2
        
        var currentResultNode = ListNode()
        var previousResultNode = ListNode()
        var exceededSum = 0

        while true {
            let sum = (firstNode?.val ?? 0) + (secondNode?.val ?? 0) + exceededSum
            currentResultNode.val = sum % 10 // Complete the currentResultNode.val
            previousResultNode.next = currentResultNode
            
            // Actions after summation
            if sum > 9 {
                exceededSum = 1
            } else {
                exceededSum = 0
            }

            // TODO: Check if it's available
            firstNode = firstNode?.next
            secondNode = secondNode?.next

            if firstResultNode == nil {
                firstResultNode = currentResultNode
            }
            previousResultNode = currentResultNode
            currentResultNode = ListNode()

            if firstNode == nil && secondNode == nil { // the end
                if exceededSum == 1 {
                    previousResultNode.next = ListNode(exceededSum)
                }
                break
            }
        }

        return firstResultNode ?? ListNode()
    }
}