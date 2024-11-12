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
    func isPalindrome(_ head: ListNode?) -> Bool {
        // key idea: 끝이 나와야만 대칭인지 아닌지 구분 가능. 왜냐면 그 전까지는 아직 반이 덜 됐을 수도 있으므로 대칭이 아니라 장담할 수 없음.
        // 1. next == nil 인 ListNode까지 가고, 가는동안 val을 배열에 저장함.
        // 2. 끝에 도달한 후 대칭인지 아닌지 확인.
        // [대칭 확인]
        // 2-1. arr[i] == arr[arr.count-i-1]으로 확인
        
        var values: [Int] = []
        var currentNode = head
        
        // 1. 끝까지 탐색
        while currentNode != nil {
            values.append(currentNode!.val)
            currentNode = currentNode?.next
        }
        
        // 2. 대칭인지 아닌지 확인
        for i in 0..<values.count/2 {
            if values[i] != values[values.count-i-1] {
                return false
            }
        }
        return true
    }
}