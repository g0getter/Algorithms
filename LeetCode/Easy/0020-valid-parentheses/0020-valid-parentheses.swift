class Solution {
    // Caution: 'same order' - ([]) (true), ([)] (false)
    func isValid(_ s: String) -> Bool {
        // Use Stack - popLast and check if the last is the same type
        var parenStack: [Character] = []
        
        for paren in s {
            if ["(", "{", "["].contains(paren) {
                parenStack.append(paren)
            } else {
                guard let last = parenStack.popLast() else { return false }
                
                if last == "(", paren == ")" {
                    continue
                } else if last == "{", paren == "}" {
                    continue
                } else if last == "[", paren == "]" {
                    continue
                } else {
                    return false
                }
            }
        }
        
        return parenStack.isEmpty
        
    // overhead?
//     enum BracketType {
//         case round
//         case curly
//         case square
        
//         var opening: String? {
//             switch self {
//                 case .round: "("
//                 case .curly: "{"
//                 case .square: "["
//                 default: nil
//             }
//         }
        
        
    }
    
}