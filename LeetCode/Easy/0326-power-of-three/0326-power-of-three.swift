class Solution {
    // 1. divide by three iteratively until it becomes 1
    func isPowerOfThree(_ n: Int) -> Bool {
        var share = Double(n)
        while share > 1 {
            share /= 3
            print(share)
        }
        
        return share == 1
    }
}