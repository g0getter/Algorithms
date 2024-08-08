//
//  SquaresOfASortedArray.swift
//  Algorithms
//
//  Created by 여나경 on 8/8/24.
//

import Foundation

class SquaresOfASortedArray: Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
//        return shortestVersion(nums)
        return sortUsingTwoPointers(nums)
//        return sortUsingTwoPointers2(nums)
    }
}

// [Sol1] The shortest version - Time complexity: O(nlogn)
extension SquaresOfASortedArray {
    func shortestVersion(_ nums: [Int]) -> [Int] {
         let squares = nums.map { $0 * $0 }
        
         return squares.sorted()
    }
}

// [Sol2] Use 2 pointers - Time Complexity: O(n), Space Complexity: O(n)
extension SquaresOfASortedArray {
    func sortUsingTwoPointers(_ nums: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = nums.count-1
        var result: [Int] = []

        while(leftIndex <= rightIndex) {
            let leftSquare = nums[leftIndex] * nums[leftIndex]
            let rightSquare = nums[rightIndex] * nums[rightIndex]
            
            if leftSquare > rightSquare {
                result.append(leftSquare)
                // result.insert(leftSquare, at: 0) // insert보다 append가 더 효율적임
                leftIndex += 1
            } else {
                result.append(rightSquare)
                // result.insert(rightSquare, at: 0) // insert보다 append가 더 효율적임
                rightIndex -= 1
            }
        }
        
        return result.reversed()
    }
}

// Reference: Discuss(https://leetcode.com/explore/learn/card/fun-with-arrays/523/conclusion/3574/discuss/332449/Swift-O(N)-Solution)
// [Sol3] Use 2 pointers(2) - Time Complexity: O(n)
extension SquaresOfASortedArray {
    func sortUsingTwoPointers2(_ A: [Int]) -> [Int] {
        let n = A.count
        var outputs = Array(repeating: 0, count: n)
        
        var i = 0, j = n - 1
        
        for p in (0 ..< n).reversed() {
            if abs(A[i]) > abs(A[j]) {
                outputs[p] = A[i] * A[i]
                i += 1
            } else {
                outputs[p] = A[j] * A[j]
                j -= 1
            }
        }
        
        return outputs
    }
}
