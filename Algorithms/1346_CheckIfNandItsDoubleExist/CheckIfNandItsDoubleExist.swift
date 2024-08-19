//
//  CheckIfNandItsDoubleExist.swift
//  Algorithms
//
//  Created by 여나경 on 8/19/24.
//

import Foundation

class CheckIfNandItsDoubleExist: Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        mySolution(arr)
    }
    
    // Time Complexity: O(n^2), Space Complexity: O(n)
    private func mySolution(_ arr: [Int]) -> Bool {
        for (i, num) in arr.enumerated() {
            var numbersToCompare = [num * 2]
            if num % 2 == 0 {
                numbersToCompare.append(num/2)
            }
            // print("num: \(num), numbersToCompare: \(numbersToCompare)")
            for (index, number) in arr.enumerated() {
                if numbersToCompare.contains(number) {
                    if index != i {
                        return true
                    }
                }
            }
        }
        
        return false
    }
    
    private func discussionSolution(_ arr: [Int]) -> Bool {
        var nums = Set<Int>()

        for num in arr {
            if nums.contains(num * 2) { return true }
            if num % 2 == 0 && nums.contains(num / 2) {
                return true
            }
            nums.insert(num)
        }

    return false
    }
}
