/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    // 이진탐색 - mid, oldMid가 아니라 left, right로 시도
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        
        while(right-left>1) {
            let mid = left+(right-left)/2
            if isBadVersion(mid) { // search a left half
                right = mid
            } else { // right half
                left = mid
            }
        }
        
        // right - left == 1
        // 둘이 같을 수는 없는지 생각 - 같을 수 있음. 처음부터 T이면.
        if isBadVersion(right) == isBadVersion(left) {
            return left
        } else {
            return right
        }
    }
}