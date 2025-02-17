class Solution {
    // Solution 2. without loops/recursion
    func isPowerOfThree(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        
        let result = logBase(Double(n), base: 3)
        // 부동소수점 오차 방지
        // (return Int(exactly: result) != nil 사용 불가)
        // n=243 -> result=4.999999 나옴
        let roundedResult = round(result)
        return pow(3, roundedResult) == Double(n)
    }
    
    func logBase(_ x: Double, base: Double) -> Double {
        return log(x) / log(base)
    }
}

extension Solution {
    // Solution 1. divide by three iteratively until it becomes 1
    func isPowerOfThree_loop(_ n: Int) -> Bool {
        var share = Double(n)
        while share > 1 {
            share /= 3
            print(share)
        }
        
        return share == 1
    }
}