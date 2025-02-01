class Solution {
    // S(k): maximum SubArray including nums[k]
    // S(k) = max(S(k-1)+nums[k], nums[k]) (k>=1, S(0) = nums[0])
    // answer: max(S)
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSubs = [nums[0]] // S
        
        for i in 1..<nums.count {
            maxSubs.append(max(maxSubs[i-1]+nums[i], nums[i]))
        }
        
        return maxSubs.max() ?? -1
    }
}