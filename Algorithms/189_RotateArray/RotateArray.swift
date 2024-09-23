//
//  RotateArray.swift
//  Algorithms
//
//  Created by 여나경 on 9/23/24.
//

import Foundation

class RotateArray: Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        // solution1(&nums, k)
        // solution2_1(&nums, k)
        solution2_2(&nums, k)
        // solution3(&nums, k)
        // solution4(&nums, k)
        
    }
    
    /// Make n-length array whose elements are nums[(i+k) % nums.count] for the index i
    // Space Complexity: O(n)
    func solution1(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        var newNums: [Int] = []
        
        for i in 0..<nums.count {
            // no need to do if we use minimized k
            // let index = (i-k+nums.count*(k/nums.count+1)) % nums.count
            let index = (i-k+nums.count) % nums.count
            newNums.append(nums[index])
        }

        nums = newNums
    }
    
    /// Use a queue
    // Space Complexity: O(1)
    func solution2_1(_ nums: inout [Int], _ k: Int) {
        var queue: [Int] = []
        
        guard nums.count > 1 else { return } // 방어
        
        for _ in 0..<k%nums.count {
            queue.append(nums.removeLast())
        }
        
        for num in queue {
            nums.insert(num, at: 0) // edge case - 쓰면서 이상하면 바로바로 방어 코드 넣기
        }
    }
    
    /// Reverse and sum two arrays
    // Space Complexity: O(1)
    func solution2_2(_ nums: inout [Int], _ k: Int) {
        var queue: [Int] = []
        
        guard nums.count > 1 else { return } // 방어
        
        for _ in 0..<k%nums.count {
            queue.append(nums.removeLast())
        }
        
        nums = queue.reversed() + nums
    }
    
    /// Sum two arrays
    // Space Complexity: O(1) (specifically, O(k%nums.count))
    func solution3(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        var arrayToInsert: [Int] = []
        
        for i in 0..<k {
            let index = nums.count-k+i
            arrayToInsert.append(nums[index % nums.count])
        }
        
        let startIndex = nums.count-k
        nums.removeSubrange(startIndex..<nums.count)
        
        nums = arrayToInsert + nums
    }
    
    /// Use `removeFirst(Int)`
    // Space Complexity: O(1), Time Complexity: O(n)
    func solution4(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        let numsCount = nums.count
        
        for i in 0..<numsCount-k {
            nums.append(nums[i])
        }
        
        nums.removeFirst(numsCount-k)
    }
    
    /// Use only reversed() func (refer to Discuss)
    func solution5(_ nums: inout [Int], _ k: Int) {
        // https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/646/discuss/54250/Easy-to-read-Java-solution/206954
    }
}



// 0 -> 0+3에 위치
// 6 -> (6+3) % 7 = 2에 위치

// 0 <- 4
// 1 <- 5
// ...
// 6 <- 3


// -3, +7
