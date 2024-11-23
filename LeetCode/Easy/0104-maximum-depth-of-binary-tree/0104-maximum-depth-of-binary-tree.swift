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
    // idea: 노드 3개짜리 tree 하나 기준, left node와 right node의 depth + 1이 root node의 depth.
    // 그리고 아래로 아래로 계속 같은 동작을 반복하면 되므로 재귀 사용해보기.
    // 하한(base condition): (root가 null 가능하다면)root가 null일 때 그대로 return. return <depth>
    // -> depth를 인자로 받아야 함. -> 그대로 return 하려면 현재 말고 부모(현재 함수를 실행시키는) 노드의 depth를 받아야 함. -> parameters: rootNode, depth.
    // reference: discuss 가장 vote 수 많은 것 참고
    func maxDepth(_ root: TreeNode?) -> Int {
        return something(root, 0)
    }
    
    func something(_ root: TreeNode?, _ depth: Int) -> Int {
        guard let node = root else { return depth } // base condition
        
        return max(something(node.left, depth+1), something(node.right, depth+1))
    }
    
    /// 첫 구상 /// -> 실패!
    // 1. 트리로 구성했을 때 마지막 줄 노드 중 non-nil 있는지 확인
    // 1-1. 마지막에서 n전 줄, ... non-nil 노드 발견할 때까지 반복
    // 2. non-nil 노드 발견했다면 '전체 level' - n이 maximum depth.
    // * 전체 level: 
    
    // 일단 탐색이 우선
    // 1. root, left-right 순서로 배열에 삽입
    // 2. 탐색할 queue에 root 넣고 loop 시작
    // 3. 탐색할 queue에 있는 것 빼서 left, right 탐색
    // 4. left, right 탐색할 때 모든 노드를(nil이라도) 탐색할 queue에 삽입
    // -- 탐색할 queue가 빌 때까지 loop 돌기
}








