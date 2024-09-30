//
//  IntersectionofTwoArraysII.swift
//  Algorithms
//
//  Created by 여나경 on 9/30/24.
//

import Foundation

class IntersectionofTwoArraysII: Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//        solution1(nums1, nums2)
         solution2(nums1, nums2)
    }
    
    func solution2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // Use 2 pointers(Ref: https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/674/discuss/1468295/Python-2-approaches-and-3-Follow-up-Questions-Clean-and-Concise)
        var intersections: [Int] = []
        var nums1 = nums1
        var nums2 = nums2
        
        // 1. Sort each array
        // 2. Increase each index
        nums1.sort()
        nums2.sort()
        var i = 0
        var j = 0
        
        while i < nums1.count && j < nums2.count {
            if nums1[i] > nums2[j] {
                j += 1
            } else if nums1[i] < nums2[j] {
                i += 1
            } else { // equal
                intersections.append(nums1[i])
                i += 1
                j += 1
            }
        }
        
        return intersections
    }
    
    func solution1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // 1. Figure out the smaller array between nums1 and nums2
        // 2. Bigger loop - bigger array, loop inside - smaller array / Check if i-th element is equal to j-th element, remove both from each array if they are equal.
        let nums1IsBigger = nums1.count > nums2.count
        var biggerNums = nums1IsBigger ? nums1 : nums2
        var smallerNums = nums1IsBigger ? nums2 : nums1
        var intersections: [Int] = []
        
        for (i, _) in biggerNums.enumerated().reversed() {
            for (j, _) in smallerNums.enumerated().reversed() {
                guard i < biggerNums.count && j < smallerNums.count else { continue }
                if biggerNums[i] == smallerNums[j] {
                    intersections.append(biggerNums[i])
                    biggerNums.remove(at: i)
                    smallerNums.remove(at: j)
                }
                // print("i: \(i), j: \(j)")
                // print("biggerNums: \(biggerNums)\nsmallerNums:\(smallerNums)")
            }
        }
        
        return intersections
        
    }
}
