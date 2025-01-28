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
            print("")
            let mid = left+(right-left)/2
            if isBadVersion(mid) { // search a left half
                right = mid
            } else { // right half
                left = mid
            }
        }
        
        // right - left == 1
        // 둘이 같을 수는 없는지 생각
        if isBadVersion(right) == isBadVersion(left) {
            return left
        } else {
            return right
        }
    }
    func old_firstBadVersion(_ n: Int) -> Int {
        // 이진 탐색.
        // 중간부터 좌or우 반의 중간, ... -> iteration (not recursion)
        
        // pick a mid number
        // let double = Double(n)/2
        // var mid = Int(round(double))
        
        // var mid = Int(round(Double(n)/2))
        var mid = n//1 + n/2
        var oldMid = 0
        
        // while(abs(mid-newMid) > 1) { // TODO: Check edge case e.g. 0
        while(true) {
            // TODO: Check odd case
            print("\(mid): \(isBadVersion(mid))")
            if isBadVersion(mid) == true { // go to search a left half
                oldMid = mid
                mid = mid - (1+abs(mid-oldMid)/2)
            } else { // right half
                oldMid = mid
                print("\(mid) + (1+(abs(\(mid)-\(oldMid)/2))")
                mid = mid + (1+abs(mid-oldMid)/2)
            }
            
            
            if abs(mid-oldMid) <= 1 { break }
        }
        
        print("\(mid) \(oldMid)")
        // abs(mid-newMid) == 1 (0은 아닐 것)
        if isBadVersion(mid) != isBadVersion(oldMid) {
            return max(mid, oldMid)    
        } else { // if both are the same, (true - leftone / false - right one)
            if (isBadVersion(mid)) {
                return max(mid, oldMid)-1
            } else {
                return max(mid, oldMid)+1
            }
        }
    }
}