//
//  MergeSortedArray.swift
//  Algorithms
//
//  Created by 여나경 on 8/13/24.
//

import Foundation

class MergeSortedArray: Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        // mergeFromTheBeginning(&nums1, m, nums2, n)
        // mergeFromTheEnd(&nums1, m, nums2, n)
        truelyMergeFromTheEnd(&nums1, m, nums2, n)
    }
    
    // Sol1. Use Swift built-in function, insert(_, at:)
    // Runtime: Beats 84.05%, Memory: Beats 7.22%
    private func mergeFromTheBeginning(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var pointer1 = 0 // index of nums1
        var pointer2 = 0 // index of nums2
        
        while pointer1 < m+pointer2 && pointer2 < n { // pointer1 < m+pointer2 -> to stop iteration when pointer1 reaches the 'pure end' of nums1
            if nums1[pointer1] <= nums2[pointer2] {
                pointer1 += 1
                continue
            } else {
                nums1.insert(nums2[pointer2], at: pointer1)
                nums1.removeLast()
                pointer2 += 1
                pointer1 += 1
            }
        }
        
        while pointer2 < n {
            nums1[m+pointer2] = nums2[pointer2]
            pointer2 += 1
        }
    }
    
    // Sol2. Merge from the end(1.my answer), ref: https://leetcode.com/explore/learn/card/fun-with-arrays/525/inserting-items-into-an-array/3253/discuss/253083/swift
    // Runtime: Beats 88.18%, Memory: Beats 96.84%
    // Time Complexity: O(m+n), Space Complexity: O(1)
    private func mergeFromTheEnd(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var pointer1 = m-1 // index of nums1
        var pointer2 = n-1 // index of nums2
        var newPointer = m+n-1
        
        while pointer1 >= 0 && pointer2 >= 0 {
            if nums1[pointer1] > nums2[pointer2] {
                nums1[newPointer] = nums1[pointer1]
                pointer1 -= 1
            } else { // if nums2 is greater or pointer1 reaches to the end
                nums1[newPointer] = nums2[pointer2]
                pointer2 -= 1
            }
            newPointer -= 1
        }

         while pointer2 >= 0 {
             nums1[newPointer] = nums2[pointer2]
             pointer2 -= 1
             newPointer -= 1
         }
    }
    
    // Sol3. Merge from the end(truely followed the reference), ref: https://leetcode.com/explore/learn/card/fun-with-arrays/525/inserting-items-into-an-array/3253/discuss/253083/swift
    // Runtime: Beats 84.05%, Memory: Beats 29.62%
    private func truelyMergeFromTheEnd(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var pointer1 = m-1 // index of nums1
        var pointer2 = n-1 // index of nums2
        var newPointer = m+n-1
        
        while newPointer >= 0 && pointer2 >= 0 {
            if pointer1 >= 0 && (nums1[pointer1] > nums2[pointer2]) {
                nums1[newPointer] = nums1[pointer1]
                pointer1 -= 1
            } else { // if nums2 is greater or pointer1 reaches to the end
                nums1[newPointer] = nums2[pointer2]
                pointer2 -= 1
            }
            newPointer -= 1
        }
    }
}
