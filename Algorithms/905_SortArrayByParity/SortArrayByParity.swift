//
//  SortArrayByParity.swift
//  Algorithms
//
//  Created by 여나경 on 9/3/24.
//

import Foundation
class SortArrayByParity: Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        snowballSolution(nums)
        // pushToTheBack(nums) // FIXME: Debug
    }
    
    // move odd numbers to back from the beginning
    // Time Complexity: O(n), Space Complexity: O(1)
    func snowballSolution(_ nums: [Int]) -> [Int] {
        var oddNumberCount = 0
        var nums = nums
        
        for i in 0..<nums.count {
            if nums[i] % 2 == 1 {
                oddNumberCount += 1
            } else if nums[i] % 2 == 0 && oddNumberCount > 0 {
                // swap
                let temp = nums[i]
                nums[i] = nums[i-oddNumberCount]
                nums[i-oddNumberCount] = temp
            }
        }
        
        return nums
    }
    
    // move odd numbers to back from the end
    // FIXME: Debug
    func pushToTheBack(_ nums: [Int]) -> [Int] {
        var oddIndexToSwap = nums.count-1
        var nums = nums
        
        for i in 0..<nums.count {
            if i >= oddIndexToSwap {
                break
            }
            if nums[i] % 2 == 1 {
                // (i) swap
                let temp = nums[i]
                nums[i] = nums[oddIndexToSwap]
                nums[oddIndexToSwap] = temp
                // oddIndexToSwap -= 1
                oddIndexToSwap = calculateOddIndexToSwap(nums, oddIndexToSwap)
                print(oddIndexToSwap)
            }
        }
        
        return nums
    }

    func calculateOddIndexToSwap(_ nums: [Int], _ currentOddIndexToSwap: Int) -> Int {
        var nextOddIndex = currentOddIndexToSwap - 1
        guard nextOddIndex >= 0 else { return -1 }
        
        while nums[nextOddIndex] % 2 == 1 && nextOddIndex >= 0 {
            nextOddIndex -= 1
            print(nextOddIndex)
        }
        
        return nextOddIndex
    }
}
