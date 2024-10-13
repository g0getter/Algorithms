//
//  MixMerge.swift
//  Algorithms
//
//  Created by 여나경 on 10/13/24.
//

import Foundation

class MixMerge {
    /// [1, 2, 3, 4, 5, 6] -> [5, 4, 6, 2, 1, 3]
    func mix(_ arr:[Int]) -> [Int] {
        // 가장 중요한 것: 1일 때 return. 설명 그대로 구현하면 됨..
        if arr.count == 1 {
            return arr
        }
        // 1. 뒤집고
        // 2. 나누고
        // 반복 후
        // 각 자리에서 merge
        
        // 1. 뒤집고
        let array = Array(arr.reversed())
        
        // 2. 나누고
        let secondStartIndex = array.count/2 + array.count%2
        let firstArr = Array(array[0...secondStartIndex-1]) // longer
        let secondArr = Array(array[secondStartIndex..<arr.count]) // shorter
        
        return mix(firstArr) + mix(secondArr)
    }
}
