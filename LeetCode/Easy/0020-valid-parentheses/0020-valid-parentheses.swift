class Solution {
    // Caution: 'same order' - ([]) (true), ([)] (false)
    func isValid(_ s: String) -> Bool {
        // Use Stack - popLast and check if the last is the same type
        var parenStack: [Character] = []
        
        for paren in s {
            // if ["(", "{", "["].contains(paren) {
            //     parenStack.append(paren)
            if paren == "(" {
                parenStack.append(")")
            } else if paren == "{" {
                parenStack.append("}")
            } else if paren == "[" {
                parenStack.append("]")
            } else {
                // guard let last = parenStack.popLast() else { return false }
                
                if parenStack.popLast() != paren {
                    return false
                }
            }
        }
        
        return parenStack.isEmpty
    }
    
}