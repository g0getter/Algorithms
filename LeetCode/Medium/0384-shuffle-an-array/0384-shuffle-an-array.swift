
class Solution {

    let originalNums: [Int]
    
    init(_ nums: [Int]) {
        originalNums = nums
    }
    
    func reset() -> [Int] {
        originalNums
    }
    
    func shuffle() -> [Int] {
        originalNums.shuffled()
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */