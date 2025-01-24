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
    func isValidBST(_ root: TreeNode?) -> Bool {
        // 1. BFS or DFS?
        // 재귀 이용, divided and conquer
        // 단순히 바로 위의 노드와 비교하는 게 아니라 그 상위 노드의 조건도 만족해야 하므로 상한과 하한이 존재해야 함.
    
        checkSubnodesRange(root, upper: Int.max, lower: Int.min)
    }
    
    // upper/lower(limit): limit of `node` and *subnodes* of `node` as well
    func checkSubnodesRange(_ node: TreeNode?, upper: Int, lower: Int) -> Bool {
        guard let node = node else { return true }
        
        // check a range of `node`
        guard node.val > lower && node.val < upper else { return false }
        
        // check a range of subnodes
        // left
        if checkSubnodesRange(node.left, upper: node.val, lower: lower) == false {
            return false
        }
        
        // right
        if checkSubnodesRange(node.right, upper: upper, lower: node.val) == false {
            return false
        }
        
        return true
    }
    
}