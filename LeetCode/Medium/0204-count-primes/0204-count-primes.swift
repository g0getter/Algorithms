class Solution {
    // Excludes (Eratosthenes)
    func countPrimes(_ n: Int) -> Int {
        // 2부터 시작, 2 배수 전부 제외
        // 그 다음 수 N부터 시작, N 배수 전부 제외
        // -> root N까지 가면 끝
        
        guard n > 2 else { return 0 }
        guard n != 3 else { return 1 }
        
        let rootN = Double(n).squareRoot()
        let intRootN = Int(floor(rootN))
        var mutableList = Array(2..<n)
        
        for num in 2...intRootN {
            guard mutableList.contains(num) else { continue }
            mutableList.removeAll { $0 % num == 0 && $0 != num }
        }
        
        return mutableList.count
    }
    
    // Runtime : SO LONG (3650ms)
    func countPrimes_checkAll(_ n: Int) -> Int {
        var primesCount = 0
        
        guard n > 2 else { return 0 }
        
        for num in 2..<n {
            if isPrime(num) {
                primesCount += 1
            }
        }
        
        return primesCount
    }
    
    // n > 2
    private func isPrime(_ n: Int) -> Bool {
        guard n >= 4 else { return true }
        let rootN = Double(n).squareRoot()
        let intRootN = floor(rootN)
        
        // 소인수가 존재하면 return false
        for num in 2...Int(intRootN) {
            if n % num == 0 {
                return false
            }
        }
        
        return true
    }
}