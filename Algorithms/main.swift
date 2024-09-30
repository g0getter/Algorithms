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
//var nums1 = [4,5,6, 0,0,0]
//let m = 3, nums2 = [1,2,3], n = 3
//MergeSortedArray().merge(&nums1, m, nums2, n)
//print("nums1: \(nums1)")

/// Remove Element
//var nums = [0,1,2,2,3,0,4,2]
//let val = 2
//RemoveElement().removeElement(&nums, val)
//print("nums: \(nums)")

/// Remove Duplicates from Sorted Array
//var input = [0,0,1,1,1,2,2,3,3,4]
//let result = RemoveDuplicatesFromSortedArray().removeDuplicates(&input)

/// Check If N and Its Double Exist
//var input = [3,1,7,11]
//let result = CheckIfNandItsDoubleExist().checkIfExist(input)

/// Valid Mountain Array
//var input = [0,3,2,1]
//let result = ValidMountainArray().validMountainArray(input)

/// Replace Elements with Greatest Element on Right Side
//var input = [17,18,5,4,6,1]
//let result = ReplaceElementswithGreatestElementonRightSide().replaceElements(input)

/// Move Zeroes
//var input = [0,1,0,3,12]
//let result = MoveZeroes().moveZeroes(&input)

/// Sort Array By Parity
//var input = [3,1,2,4]
//let result = SortArrayByParity().sortArrayByParity(input)

/// Find Pivot Index
//var input = [1,7,3,6,5,6]
//let result = FindPivotIndex().pivotIndex(input)

/// Largest Number At Least Twice of Others
//var input = [3,6,1,0]
//let result = LargestNumberAtLeastTwiceofOthers().dominantIndex(input)

/// Plus One
//var input = [9]
//let result = PlusOne().plusOne(input)

/// Single Number
//var input = [4,1,2,1,2]
//let result = SingleNumber().singleNumber(input)

/// Rotate Array
//var input = [1,2,3,4,5,6,7]
//let k = 3
//RotateArray().rotate(&input, k)

/// Intersection of Two Arrays II
var nums1 = [4,9,5], nums2 = [9,4,9,8,4]
let result = IntersectionofTwoArraysII().intersect(nums1, nums2)
print("nums1: \(nums1)\nnums2: \(nums2)\nresult: \(result)")

protocol Solution {}
