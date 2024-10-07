class Solution {
    func reverseString(_ s: inout [Character]) {
        let length = s.count
        
        for i in 0..<length {
            s.insert(s[i], at: length) 
            // h e l l o "h", 
            // h e l l o "e" h
        }
    
        s.removeFirst(length)
    }
}