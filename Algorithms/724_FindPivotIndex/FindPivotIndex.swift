//
//  FindPivotIndex.swift
//  Algorithms
//
//  Created by 여나경 on 9/13/24.
//

import Foundation

class FindPivotIndex: Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        var leftSum = 0
        var rightSum = nums.reduce(0, +)// - (nums.first ?? 0)
        
        guard nums.count > 0 else  { return -1 }
        
        for (index, num) in nums.enumerated() {
            rightSum -= num
            
            if leftSum == rightSum {
                return index
            }
            
            // setup values to move to a next index
            leftSum += num
        }
        
        return -1
    }
}
