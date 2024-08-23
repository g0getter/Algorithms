//
//  ReplaceElementswithGreatestElementonRightSide.swift
//  Algorithms
//
//  Created by 여나경 on 8/23/24.
//

import Foundation

// Time Complexity: O(n), Space Complexity: O(어쩔 수 없이 n)
class ReplaceElementswithGreatestElementonRightSide: Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        return optimizedSolution(arr)
    }
    
    func optimizedSolution(_ arr: [Int]) -> [Int] {
        var max = -1
        var resultArr = arr
        
        for (index, num) in resultArr.enumerated().reversed() { // or use stride() like below
        // for index in stride(from: resultArr.count - 1, through: 0, by: -1) {
            resultArr[index] = max
            
            // prepare for the next element
            if num > max {
                max = num
            }
        }
        
        return resultArr
    }
}
