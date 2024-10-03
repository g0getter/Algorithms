class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // solution1(nums, target)
        solution2(nums, target)
    }
    
    // 1. Most simple, easy way: O(n^2) time complexity - Find each pair and return if it exists.
    // (brute force way)
    func solution1(_ nums: [Int], _ target: Int) -> [Int] {
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
    
    // 2. Use a Hashmap
    func solution2(_ nums: [Int], _ target: Int) -> [Int] {
        // var partnerHashMap: [Int: Int] = [:] // [<index>: <value>]
        var partnerHashMap: [Int: Int] = [:] // [<value>: <index>]
        
        for (index, num) in nums.enumerated() {
            partnerHashMap[target - num] = index
        }
        print(partnerHashMap)
        for (index, num) in nums.enumerated() {
            guard let partnerIndex = partnerHashMap[num], index != partnerIndex else { continue }
            return [index, partnerIndex]
        }
        return []
    } 
}