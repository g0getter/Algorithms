class Solution {
    // Solution 3: Eratosthenes, not using removeAll, using a Bool array
    // 배열을 직접 수정하는 것이 새로운 배열을 생성하는 것(countPrimes_usingRemoveAll)보다 훨씬 효율적
    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else { return 0 }
        var isPrimes = Array(repeating: true, count: n) // to exclude isPrimes[n]
        var primeCount = 0

        // switch to FALSE
        for i in 2..<isPrimes.count {
            guard isPrimes[i] else { continue }
            primeCount += 1

            // 배수 삭제
            var multiple = i * 2 // start from 2 to exclude i itself
            while (multiple < n) {
                isPrimes[multiple] = false
                multiple += i
            }
        }

        return primeCount
    }

    // Solution 2: Excludes (Eratosthenes) - 2795ms
    // Time complexity: O(n*root n) because of removeAll(O(n))
    func countPrimes_usingRemoveAll(_ n: Int) -> Int {
        // 2부터 시작, 2 배수 전부 제외
        // 그 다음 수 N부터 시작, N 배수 전부 제외
        // -> root N까지 가면 끝
        
        guard n > 2 else { return 0 }
        guard n != 3 else { return 1 }
        
        let rootN = Double(n).squareRoot()
        let intRootN = Int(floor(rootN))
        var mutableList = Array(2..<n)
        
        
        for num in 2...intRootN { // -> O(root N)
            guard mutableList.contains(num) else { continue }
            mutableList.removeAll { $0 % num == 0 && $0 != num } // time: O(n)
        }
        
        return mutableList.count
    }
    
    // Solution 1: Runtime SO LONG (3650ms)
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