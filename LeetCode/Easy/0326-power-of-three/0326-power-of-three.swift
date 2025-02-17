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
        return log10(x) / log10(base)
        // logBase에서 자연로그 아닌 상용로그(log10) 사용하면 `return Int(exactly: result) != nil` 사용 가능.
        // 왜냐하면, e는 무리수라서 이진법으로 표현 불가능 -> 부동소수점 연산 시 정확한 값으로 표현할 수 없어 오차 발생
        // * 부동소수점 발생 이유: '이진법으로 정확하게 표현할 수 없는 숫자'는 근사값으로 저장해야 하므로 발생.
        // 따라서 10진수를 다룰 때는 log10이 더 정확한 경우가 많음(하지만 절대적으로 보장하는 것은 아님)
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