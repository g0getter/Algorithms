class Solution {
    func climbStairs(_ n: Int) -> Int {
        // W(n+2) = W(n) + W(n+1) (n>=1)
        guard n != 1 else { return 1 }
        guard n != 2 else { return 2 }
        
        var stepStack = [1, 2] // step1, step2
        
        for level in 3...n {
            let sum = stepStack[0] + stepStack[1]
            stepStack.removeFirst()
            stepStack.append(sum)
        }
        
        guard stepStack.count == 2 else { return -1 }
        
        return stepStack.last ?? -1
    }
}