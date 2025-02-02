// Solution 1(Fisher-Yates Algorithm): return an array with a loop generating a random number for each index and remove the index from the original array -> high time complexity O(n^2)(due to .remove(index))
// Solution 2: return an array with a loop generating a random number for each index and SWAP with the index from the original array -> linear time complexity O(n)
class Solution {

    private let originalNums: [Int]
    
    init(_ nums: [Int]) {
        originalNums = nums
    }
    
    func reset() -> [Int] {
        originalNums
    }
    
    func shuffle() -> [Int] {
        // Solution 1: Fisher-Yates Algorithm
        var shuffledNums: [Int] = []
        var nums = originalNums
        for _ in originalNums {
            let i = Int.random(in: 0..<nums.count)
            shuffledNums.append(nums[i])
            nums.remove(at: i)
        }

        return shuffledNums
        
        // Solution 2: Fisher-Yates > modern method(Durstenfeld's/Knuth's)
        // var nums = originalNums
        // for i in (1..<nums.count).reversed() {
        //     let randomI = Int.random(in: 0..<i)
        //     // swap
        //     let temp = nums[i]
        //     nums[i] = nums[randomI]
        //     nums[randomI] = temp
        // }
        
        // return nums
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_2: [Int] = obj.shuffle()
 * let ret_1: [Int] = obj.reset()
 */