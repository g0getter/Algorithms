//
//  PlusOne.swift
//  Algorithms
//
//  Created by 여나경 on 9/16/24.
//

import Foundation

class PlusOne: Solution {
    // Time Complexity: O(n), Space Complexity: O(n)
    func plusOne(_ digits: [Int]) -> [Int] {
        // upgraded version (1, 2)
        var currentDigit = digits.count - 1
        var resultDigits = digits

        while(currentDigit >= 0) {
            resultDigits[currentDigit] += 1

            if resultDigits[currentDigit] < 10 {
                return resultDigits
            }
            
            // (1) would be better than `resultDigits[currentDigit] = resultDigits[currentDigit] % 10`
            resultDigits[currentDigit] = 0
            currentDigit -= 1
        }
        
        // (2) In case the number of digit should be increased, and all digits but the first are 0s.
        resultDigits = [Int](repeating: 0, count: digits.count+1)
        resultDigits[0] = 1
        return resultDigits
    }
}
