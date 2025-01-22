/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        // 포인터 두 개 - tortoise와 hare 사용.
        // 순환 영역에 들어가면 무조건 만나게 될 수 밖에 없음.
        // <- 둘의 속도가 다르기 때문에. 공배수의 문제가 아니라 거리 차이가 점차 줄어들기 때문에 결국에는 만남.
        var tortoise = head // tortoise node
        var hare = head // hare node
        
        while hare?.next?.next != nil { // hare만 하면 node가 하나인 경우 true 나옴. 두 번을 하는 이유는 끝을 더 빨리 탐지하기 위해서.
            tortoise = tortoise?.next // goes 1 step
            hare = hare?.next?.next // goes 2 steps
            
            if tortoise === hare { // not comparing the value of `val`, `next`, but the reference values(object references)
                return true
            }
        }
        
        return false // does not have a cycle
    }
}