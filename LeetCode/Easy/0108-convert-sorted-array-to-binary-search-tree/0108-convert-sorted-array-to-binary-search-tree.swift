/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

 
class Solution {

    // divide and conquer, recursion 사용
    // 1. 중간 것 찾음
    // 2. 중간에 두고, 나머지를 두 부분으로 나눔
    // 3. 나머지 2개에 대해 1-2 반복
    // 4. 나머지들의 길이가 1이 되면 return
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else { return nil }

        let midIndex = nums.count / 2 // index of root node
        
        let left = sortedArrayToBST(Array(nums[0..<midIndex]))
        let right = sortedArrayToBST(Array(nums[(midIndex+1)...]))
        // 가능한 이유는, midIndex+1이 아무리 커봤자 nums.count를 넘지 않기 때문.(초과하지 않으면 에러 발생X)
        return TreeNode(nums[midIndex], left, right)
    }
}