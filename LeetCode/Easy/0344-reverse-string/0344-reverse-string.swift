class Solution {
    func reverseString(_ s: inout [Character]) {
        // solution1(&s)
        solution2(&s)
    }
    
    // Insert and remove others
    func solution1(_ s: inout [Character]) {
        let length = s.count
        
        for i in 0..<length {
            s.insert(s[i], at: length) 
            // h e l l o "h", 
            // h e l l o "e" h
        }
    
        s.removeFirst(length)
    }
    
    // Swap with two pointers
    func solution2(_ s: inout [Character]) {
        var i = 0
        var j = s.count - 1
        
        while (i < j) {
            let temp = s[i]
            s[i] = s[j]
            s[j] = temp
            i += 1
            j -= 1
        }
    }
}