//
//  main.swift
//  Algorithms
//
//  Created by 여나경 on 8/7/24.
//

import Foundation


/// Height Checker
//let input = [1,1,4,2,1,3]
//let result = HeightChecker().heightChecker(input)

/// Third Maximum Number
//let input = [3,2,1]
//let result = ThirdMaximumNumber().thirdMax(input)

/// Find All Numbers Disappeared in an Array
//let input = [4,3,2,7,8,2,3,1]
//let result = FindAllNumbersDisappeared().findDisappearedNumbers(input)

/// Squares of a Sorted Array
//let input = [-4,-1,0,3,10]
//let result = SquaresOfASortedArray().sortedSquares(input)

/// Duplicate Zeros
//var input = [1,0,2,3,0,4,5,0]
//let result = DuplicateZeros().duplicateZeros(&input)

/// Merge Sorted Array
var nums1 = [4,5,6, 0,0,0]
let m = 3, nums2 = [1,2,3], n = 3
MergeSortedArray().merge(&nums1, m, nums2, n)
print("nums1: \(nums1)")

//print("input: \(input)\nresult: \(result)\n")

protocol Solution {}
