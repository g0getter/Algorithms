//
//  FindAllNumbersDisappeared.swift
//  Algorithms
//
//  Created by 여나경 on 8/7/24.
//

import Foundation

// First written on 2024/8/5
class FindAllNumbersDisappeared: Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        // [Sol1] Time Complexity: O(n^2) (Too complex!)
        // 1. Find out 'n'
        // 2. Compare nums and [1, n]
        // Make an array which consists of [1, n] and remove elements which is included in nums
        
        // var nonAppearNums = Array(1...nums.count)
        
        // nums.forEach { num in
        //     nonAppearNums.removeAll { num == $0 }
        // }
        
        
        // [Sol2] Sort in non-increasing order, remove duplicates and remove the element at an exact index
        // Time Complexity: O(N+(built-in sorted)), Space Complexity: O(N)
        // 1. Sort in non-increasing order
        
//         let decreasingNums = nums.sorted { $0 > $1 }
//         var previousNum = -1
//        
//         for num in decreasingNums {
//             if previousNum == num { // Prevent removing the same index twice
//                 continue
//             }
//             nonAppearNums.remove(at: num-1)
//             previousNum = num
//         }
//         return nonAppearNums
        
        
        // [Sol3] Use 'nums' array itself
        // Time Complexity: O(N), Space Complexity: O(N)
        var newNums = Array(1...nums.count)
        for num in nums {
            if newNums[num-1] > 0 {
                newNums[num-1] = num * -1
            }
        }
        
        var resultNums: [Int] = []
        for num in newNums {
            if num > 0 {
                resultNums.append(num)
            }
        }
        return resultNums
        
    }
}
