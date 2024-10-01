class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // 1. Most simple, easy way: O(n^2) time complexity - Find each pair and return if it exists.
        // (brute force way)
        var i = 0
        var j = 1
        
        while(i+1 < nums.count) {
            while(j < nums.count) {
                guard nums[i] + nums[j] != target else { return [i, j] }
                j += 1
            }
            i += 1
            j = i + 1
        }
        
        return []
    }
}