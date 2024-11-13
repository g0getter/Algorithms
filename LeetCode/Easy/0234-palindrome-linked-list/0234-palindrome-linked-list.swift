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
        // solution1(head)
        solution2(head)
    }
    // key idea: 끝이 나와야만 대칭인지 아닌지 구분 가능. 왜냐면 그 전까지는 아직 반이 덜 됐을 수도 있으므로 대칭이 아니라 장담할 수 없음.
    // 1. next == nil 인 ListNode까지 가고, 가는동안 val을 배열에 저장함.
    // 2. 끝에 도달한 후 대칭인지 아닌지 확인.
    // [대칭 확인]
    // 2-1. arr[i] == arr[arr.count-i-1]으로 확인
    // Space Complexity: O(N), Time Complexity: O(N)

    private func solution1(_ head: ListNode?) -> Bool {
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

    // for a Space Complexity of O(1) and Time complexity of O(N)
    // Space O(1) 되려면 저장하면 안됨.
    // key idea1: 두 배로 빠른 pointer 사용. 일반 pointer와 함께 pointer 2개 사용 시 일반 pointer는 딱 중간에 도착해있음.
    // key idea2: 뒤에서부터 비교하려면 방향을 반대로 바꿔야 함. -> 일반 pointer가 끝으로 이동하며 변경.
    // https://leetcode.com/problems/palindrome-linked-list/solutions/1137027/js-python-java-c-easy-floyd-s-reversal-solution-w-explanation
    private func solution2(_ head: ListNode?) -> Bool {
        // 1. Use two pointers
        var fast = head
        var slow = head

        while fast?.next?.next != nil { // slow의 위치를 지정하는 것과 연관. next 하나든 두 개든 상관 없음. (slow가 짝수일 때 반의 앞쪽에 있나 뒷쪽에 있나 차이(=어디서부터 방향을 바꾸느냐)인데 둘 다 정상 결과 나옴)
            fast = fast?.next?.next
            slow = slow?.next
        }

        // print("1.FAST:\(fast?.val)")
        // print("1.SLOW:\(slow?.val)")

        // -> slow: 딱 중간
        // slow가 방향 바꾸면서(three-way swap) 끝까지 가기
        var prev = slow?.copy() as? ListNode // 필수. 이하 나머지는 shallow copy 해도 됨
        prev?.next = nil // 끊기 위해
        slow = slow?.next//?.copy() as? ListNode
        
        while slow != nil {
            let temp = slow?.next//?.copy() as? ListNode
            slow?.next = prev//?.copy() as? ListNode
            prev = slow//?.copy() as? ListNode
            slow = temp//?.copy() as? ListNode
        }
        
        // -> slow: 끝(X). prev가 끝.
        fast = head
        slow = prev

        // 비교
        while slow != nil {
            // print("-START-")
            // print("FAST:\(fast?.val), FAST.next: \(fast?.next?.val)")
            // print("SLOW:\(slow?.val), SLOW.next: \(slow?.next?.val)")
            if fast?.val != slow?.val {
                return false
            }
            fast = fast?.next
            slow = slow?.next
        }
        return true
    }
}

extension ListNode {
    // Deep copy
    func copy() -> Any {
        return ListNode(self.val, self.next)
    }
}












