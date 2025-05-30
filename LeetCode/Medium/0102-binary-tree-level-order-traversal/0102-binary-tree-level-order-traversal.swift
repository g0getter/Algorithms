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
    // 1. dfs or bfs? bfs
    // flatten subnodes of nodes at the same level
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var result: [[Int]] = [[root.val]]
        var newNodes: [TreeNode] = [root]
        
        while(true) {
            newNodes = getSubnodes(of: newNodes)
            guard newNodes.isEmpty == false else { return result }
            
            let newValues = newNodes.map { $0.val }
            result.append(newValues)
        }
        
        return result
    }
    
    func getSubnodes(of nodes: [TreeNode]) -> [TreeNode] {
        
        let flattenedSubnodes = nodes.flatMap { [$0.left, $0.right] }.compactMap{$0}
        // print(flattenedSubnodes)
        
        return flattenedSubnodes
    }
}