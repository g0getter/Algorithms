//
//  RemoveDuplicatesFromSortedArray.swift
//  Algorithms
//
//  Created by 여나경 on 8/15/24.
//

import Foundation

// Time Complexity: O(n), Space Complexity: O(1)
class RemoveDuplicatesFromSortedArray: Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        // Use two pointers
        var maxValidIndex = 0
        var k = 1 // 1 <= nums.length <= 3 * 104

        for num in nums {
            if nums[maxValidIndex] != num {
                nums[maxValidIndex+1] = num
                maxValidIndex += 1
                k += 1
            }
        }
        
        return k
    }
}
