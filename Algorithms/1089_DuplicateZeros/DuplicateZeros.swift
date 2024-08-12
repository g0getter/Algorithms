//
//  DuplicateZeros.swift
//  Algorithms
//
//  Created by 여나경 on 8/12/24.
//

import Foundation

class DuplicateZeros: Solution {
    // Time Complexity: O(n), Space Complexitiy: O(n)
    func duplicateZeros(_ arr: inout [Int]) {
        var zeroIndexes: [Int] = []
        
        // zeroIndexes: original index where 0 is located
        for (index, num) in arr.enumerated() {
            if num == 0 {
                zeroIndexes.append(index)
            }
        }
        
        // zeroIndexes(updated): index to insert new 0
        for (index, num) in zeroIndexes.enumerated() {
            zeroIndexes[index] = num + index // consider former inserted zeros
        }
        
        let length = arr.count
        for index in zeroIndexes {
            guard index < length else { return }
            arr.insert(0, at: index)
            arr.removeLast()
        }
    }
}
