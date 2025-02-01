class Solution {
    // Solution(2)
    // not to use .max() at the end
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSubs = [nums[0]] // S
        var maxSubSoFar = nums[0]
        
        for i in 1..<nums.count {
            maxSubs.append(max(maxSubs[i-1]+nums[i], nums[i]))
            maxSubSoFar = max(maxSubs[i], maxSubSoFar)
        }
        
        return maxSubSoFar
    }

    // Solution(1)
    // O(n) solution
    // S(k): maximum SubArray including nums[k]
    // S(k) = max(S(k-1)+nums[k], nums[k]) (k>=1, S(0) = nums[0])
    // answer: max(S)
    func maxSubArray_Kadane(_ nums: [Int]) -> Int {
        var maxSubs = [nums[0]] // S
        
        for i in 1..<nums.count {
            maxSubs.append(max(maxSubs[i-1]+nums[i], nums[i]))
        }
        
        return maxSubs.max() ?? -1
    }
}