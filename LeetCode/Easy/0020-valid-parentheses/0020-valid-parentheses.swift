class Solution {
    // Caution: 'same order' - ([]) (true), ([)] (false)
    func isValid(_ s: String) -> Bool {
        // Use Stack - popLast and check if the last is the same type
        var parenStack: [Character] = []
        
        // converting when pushing(BETTER) <- no need to use contains(), simpler condition statements
        for paren in s {
            if paren == "(" {
                parenStack.append(")")
            } else if paren == "{" {
                parenStack.append("}")
            } else if paren == "[" {
                parenStack.append("]")
            // } else if parenStack.popLast() == paren { // closing parenthesis
            //     continue
            // } else {
            //     return false
            // }
            } else if parenStack.popLast() != paren { // closing parenthesis
                return false
            }
        }
        
        return parenStack.isEmpty
    }
    
}