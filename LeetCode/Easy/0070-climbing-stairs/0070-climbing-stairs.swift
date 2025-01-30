class Solution {
    func climbStairs(_ n: Int) -> Int {
        // W(n+2) = W(n) + W(n+1) (n>=1)
        guard n != 1 else { return 1 }
        guard n != 2 else { return 2 }
        
        var stepQueue = [1, 2] // step1, step2
        
        for level in 3...n {
            let sum = stepQueue[0] + stepQueue[1]
            stepQueue.removeFirst()
            stepQueue.append(sum)
        }
        
        // guard stepQueue.count == 2 else { return -1 }
        
        return stepQueue.last ?? -1
    }
}