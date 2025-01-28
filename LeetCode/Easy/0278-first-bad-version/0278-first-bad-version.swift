/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {

    // 이진탐색(3) - while 조건 left<right로 설정
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        
        while(left<right) {
            let mid = left+(right-left)/2
            if isBadVersion(mid) { // search a left half
                right = mid
            } else { // right half
                left = mid + 1 // 왜냐면, F~F는 탐색할 구간이 아님. ()
            }
        }
        
        return right
    }

    // 이진탐색(2) - 마지막에 left, right T/F 비교 조건문 생략
    // - 처음부터 T인 것만 아니라면 left는 항상 F, right는 항상 T인 값이므로.
    // (왜냐면 애초부터 로직이 mid가 T인지 F인지에 따라 mid를 right 혹은 left로 바꾸는 것이므로)
    func firstBadVersion_2(_ n: Int) -> Int {
        var left = 1
        var right = n
        
        guard isBadVersion(left) == false else { return 1 }

        while(right-left>1) {
            let mid = left+(right-left)/2
            if isBadVersion(mid) { // search a left half
                right = mid
            } else { // right half
                left = mid
            }
        }
        
        return right
    }
    
    // 이진탐색(1) - mid, oldMid가 아니라 left, right로 시도
    func firstBadVersion_1(_ n: Int) -> Int {
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