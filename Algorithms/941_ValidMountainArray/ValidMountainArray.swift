//
//  ValidMountainArray.swift
//  Algorithms
//
//  Created by 여나경 on 8/22/24.
//

import Foundation

// Time Complexity: O(n), Space Complexity: O(1)
class ValidMountainArray: Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        var increased = false
        var decreased = false
        
        for index in 0..<arr.count-1 {
            if arr[index] < arr[index+1] { // <
                if decreased == true {
                    return false
                }
                increased = true
            } else if arr[index] == arr[index+1] { // ==
                return false
            } else { // >
                if increased == false {
                    return false
                }
                decreased = true
            }
        }
        
        return increased && decreased
    }
    
    // TODO: Use more powerful solution(even written in different programming languages) in Discuss
}
