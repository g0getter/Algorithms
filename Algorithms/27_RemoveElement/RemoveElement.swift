//
//  RemoveElement.swift
//  Algorithms
//
//  Created by 여나경 on 8/14/24.
//

import Foundation

class RemoveElement: Solution {
    var maxNonValIndex = 100
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        // removeAndNotSort(&nums, val)
        removeAndSort(&nums, val)
    }
    
    func removeAndNotSort(_ nums: inout [Int], _ val: Int) -> Int {
        var nonEmptyNumber = 0
        
        for (index, num) in nums.enumerated() {
            guard index <= maxNonValIndex else {
                return nonEmptyNumber
            }
            if num == val {
                let nextMaxIndex = getMaximumIndex(nums, val)
                guard nextMaxIndex > index else { return nonEmptyNumber }
                nums[index] = nums[nextMaxIndex]
                // No need to switch, but fill the current index
                print("index: \(index), nums: \(nums), nonEmptyNumber: \(nonEmptyNumber), nextMaxIndex: \(nextMaxIndex)")
            } else {
                nonEmptyNumber += 1
                print("index: \(index), nums: \(nums), nonEmptyNumber: \(nonEmptyNumber)")
            }
        }
        
        return nonEmptyNumber
    }
    
    /// (ONGOING) Calculate currently (next) maximum index of non-val element
    private func getMaximumIndex(_ nums: [Int], _ val: Int) -> Int {
        if maxNonValIndex == 100 {
            maxNonValIndex = nums.count
        }
        
        for i in (0..<maxNonValIndex).reversed() {
            if nums[i] != val {
                maxNonValIndex = i
                return i
            }
        }
        
        return -1
    }
    
    /// Remove and keep the original order(not necessary)
    func removeAndSort(_ nums: inout [Int], _ val: Int) -> Int {
        var emptyIndexes: [Int] = []
        var nonEmptyNumber = 0
        
        for (index, num) in nums.enumerated() {
            if num == val {
                emptyIndexes.append(index)
                nums[index] = -1
            } else {
                nonEmptyNumber += 1
                 if emptyIndexes.isEmpty == false {
                    nums.insert(num, at: emptyIndexes[0])
                    emptyIndexes.removeFirst()

                    nums[index] = -1
                    emptyIndexes.append(index)
                }
            }
//            print("nums: \(nums), emptyIndexes: \(emptyIndexes), nonEmptyNumber: \(nonEmptyNumber)")
        }
        
        return nonEmptyNumber
    }
}
