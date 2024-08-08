//
//  HeightChecker.swift
//  Algorithms
//
//  Created by 여나경 on 8/7/24.
//

import Foundation

// First written on 2024/8/2
class HeightChecker: Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        var count = 0
        // let expected = heights.sorted() // Sol1. Use built-in sort func
        let expected = bubbleSort(heights) // Sol2. Use Bubble sort
        // let expected = mer// Sol3. Use Merge sort

        for (index, height) in heights.enumerated() {
            if height != expected[index] {
                count += 1
            }
        }
        return count
    }
    
    private func bubbleSort(_ list: [Int]) -> [Int] {
        var sortedList = list
        
        // outer loop indicating where the inner loop starts
        for i in 0..<sortedList.count-1 {
            // inner loop to swap elements
            for j in 0..<sortedList.count-i-1 {
                if sortedList[j] > sortedList[j+1] {
                    let temp = sortedList[j]
                    sortedList[j] = sortedList[j+1]
                    sortedList[j+1] = temp
                }
            }
            // print(sortedList)
        }
        
        return sortedList
    }
    
    // Time complexity: O(nlogn)
    private func mergeSort(_ list: [Int]) -> [Int] {
        let result: [Int] = []
        // 1. Divide into two halves
        // 2. Sort each half, starting from the smallest half whose has only one member
        // 3. Merge the sorted half
        // ------ DONE RECURSIVELY -----
        return result
    }
    
    
}
