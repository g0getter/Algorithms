//
//  SortArrayByParity.swift
//  Algorithms
//
//  Created by 여나경 on 9/3/24.
//

import Foundation
class SortArrayByParity: Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
//        snowballSolution(nums)
         pushToTheBack(nums)
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
    
    // move odd numbers to back
    // Time Complexity: O(n), Space Complexity: O(1) but pretty slow..  
    func pushToTheBack(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        
        var evenIndexToSwap = calculateEvenIndexToSwap(nums, nums.count)
        guard evenIndexToSwap >= 0 else { return nums }
        
        var nums = nums
        var i = 0
        
        while i < evenIndexToSwap {
            if nums[i] % 2 == 1 {
                // swap
                let temp = nums[i]
                nums[i] = nums[evenIndexToSwap]
                nums[evenIndexToSwap] = temp
                evenIndexToSwap = calculateEvenIndexToSwap(nums, evenIndexToSwap)
            }
            i += 1
        }
        
        return nums
    }

    func calculateEvenIndexToSwap(_ nums: [Int], _ currentEvenIndexToSwap: Int) -> Int {
        var nextEvenIndex = currentEvenIndexToSwap - 1
        
        while nextEvenIndex >= 0, nums[nextEvenIndex] % 2 == 1 {
            nextEvenIndex -= 1
        }
        
        return nextEvenIndex
    }
}
