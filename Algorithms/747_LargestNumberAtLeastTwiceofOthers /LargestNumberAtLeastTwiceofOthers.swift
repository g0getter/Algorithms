//
//  LargestNumberAtLeastTwiceofOthers.swift
//  Algorithms
//
//  Created by 여나경 on 9/13/24.
//

import Foundation

class LargestNumberAtLeastTwiceofOthers: Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        var maxIndex = -1
        var maxValue = -1
        
        /// Find out the maximum value and the index
        for (index, value) in nums.enumerated() {
            if value > maxValue {
                maxIndex = index
                maxValue = value
            }
        }
        
        for value in nums {
            if value == maxValue { continue }
            
            if maxValue < value * 2 {
                return -1
            }
        }
        
        return maxIndex
    }
}
