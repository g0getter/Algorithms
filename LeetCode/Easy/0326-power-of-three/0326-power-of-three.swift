class Solution {
    // Solution 2. without loops/recursion
    func isPowerOfThree(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        
        let result = logBase(Double(n), base: 3)
        // 부동소수점 오차 방지
        let roundedResult = round(result)
        return pow(3, roundedResult) == Double(n)
        // print(result)
        // print(Int(exactly: result))
        // return Int(exactly: result) != nil // if Double is exactly Int
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