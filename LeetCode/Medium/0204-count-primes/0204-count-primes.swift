class Solution {
    func countPrimes(_ n: Int) -> Int {
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