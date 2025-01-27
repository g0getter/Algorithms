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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        // divide and conquer, recursion 사용
        // 1. 중간 것 찾음
        // 2. 중간에 두고, 나머지를 두 부분으로 나눔
        // 3. 나머지 2개에 대해 1-2 반복
        // 4. 나머지들의 길이가 1이 되면 return
        findMidAndGetTwoSubs(nums)
    }
    
    func findMidAndGetTwoSubs(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else { return nil }
        
        let midIndex = nums.count / 2
        
        // *반환 조건* 양쪽 길이가 1인지 확인
        if midIndex == 1 { // 앞쪽은 뒤쪽 길이보다 1 길거나 같음
            let left = TreeNode(nums[0])
            var right: TreeNode? = nil
            if midIndex+1 < nums.count { // 뒤쪽이 있으면
                right = TreeNode(nums[midIndex+1])
            }
            
            return TreeNode(nums[midIndex], left, right)
        }
        
        // 아직 더 돌려야 함
        let leftNums = Array(nums[0..<midIndex])
        var rightNums: [Int] = []
        if midIndex+1 < nums.count { // 뒤쪽이 있으면
            rightNums = Array(nums[(midIndex+1)...])
        }
        
        let left = findMidAndGetTwoSubs(leftNums)
        let right = findMidAndGetTwoSubs(rightNums)
        
        // print(leftNums)
        // print(rightNums)
        
        return TreeNode(nums[midIndex], left, right)
        
    }
}