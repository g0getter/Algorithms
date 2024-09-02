//
//  MoveZeroes.swift
//  Algorithms
//
//  Created by 여나경 on 9/2/24.
//

import Foundation

class MoveZeroes: Solution {
    func moveZeroes(_ nums: inout [Int]) {
        myPreviousSolution(&nums)

    }
    
    func discussSolution(_ nums: inout [Int]) {
        var snowballSize = 0
        
        for i in 0..<nums.count {
            if nums[i] == 0 {
                snowballSize += 1
            } else if nums[i] != 0 && snowballSize > 0 {
                // change(swap) with the first part of snowball
                nums[i-snowballSize] = nums[i]
                nums[i] = 0
            }
        }
    }
    
    func myPreviousSolution(_ nums: inout [Int]) {
        // Use two variables
        var indexToFill = 0
        var zeroNum = 0
        
        for num in nums {
            if num == 0 {
                zeroNum += 1
                
            } else {
                nums[indexToFill] = num
                indexToFill += 1
            }
        }
        
        for i in indexToFill..<nums.count {
            nums[i] = 0
        }
    }
}
