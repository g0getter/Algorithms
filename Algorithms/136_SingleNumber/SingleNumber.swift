//
//  SingleNumber.swift
//  Algorithms
//
//  Created by 여나경 on 9/20/24.
//

import Foundation

class SingleNumber: Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        // Sol 1. for loop solution
        var answer = 0
        
        for num in nums {
            answer = answer ^ num
        }

        return answer
        
//        usingReduce(nums)
    }
    
    // Sol 2. Use Higher-order functions, `reduce()`.
    func usingReduce(_ nums: [Int]) -> Int {
        nums.reduce(0, ^)
    }
}
