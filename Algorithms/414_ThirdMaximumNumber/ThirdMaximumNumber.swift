//
//  ThirdMaximumNumber.swift
//  Algorithms
//
//  Created by 여나경 on 8/7/24.
//

import Foundation

// First written on 2024/8/4
class ThirdMaximumNumber: Solution {
    
    func thirdMax(_ nums: [Int]) -> Int {
        // return setAndSort(nums) // Sol1. Use built-in sorting method
        return threePointers(nums) // Sol2. Use three pointer(Approach4 in solution)
        
    }
    
    // Time Complexity: O(N), Space Complexity: O(1)
    func threePointers(_ nums: [Int]) -> Int {
        var firstMax = Int.min
        var secondMax = Int.min
        var thirdMax = Int.min

        for num in nums {
            if (num == firstMax || num == secondMax || num == thirdMax ) {
                continue
            }
            if num > firstMax {
                thirdMax = secondMax
                secondMax = firstMax
                firstMax = num
            } else if num > secondMax { // between second and first
                thirdMax = secondMax
                secondMax = num
            } else if num > thirdMax {
                thirdMax = num
            }
        }

        if thirdMax == Int.min {
            return nums.max() ?? -1
        }
        print(firstMax)
        return thirdMax
    }
    
    // Time Complexity: O()(sorted()+max()), Space Complexity: O(N) - 나중에 Analyze Complexity 기능 사용해서 알아두기(1일 2회?)
    func setAndSort(_ nums: [Int]) -> Int {
        // 1. Remove duplicates
        let setNums = Set(nums)
        
        // 2. Pick a third maximum number
        // 2-1. Sort in descending(non-increasing) order
        let descendingSetNums = setNums.sorted { $0 > $1 }
        // 2-2. Pick a third one
        guard descendingSetNums.count >= 3 else { return descendingSetNums.max() ?? -1 }
        return descendingSetNums[2]
    }
}
