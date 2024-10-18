class Solution {
    func myAtoi(_ s: String) -> Int {
        var sign = "" // "" or "-"
        var stringInt = ""
        
        // overflow 통제: sign 붙여서 Int 전환 시 nil 나오는지 아닌지로 판별(단, digit으로 구성된 string)
        // Int == Int64
        
        // 1. whitespace
        var trimmedString = s.trimmingCharacters(in: .whitespaces)
        
        guard let firstString = trimmedString.first else { return 0 }
        
        // 2. signedness
        if firstString == "+" {
            trimmedString.removeFirst()
        } else if firstString == "-" {
            sign = "-"
            trimmedString.removeFirst()
        }
        
        for char in trimmedString {
            // digit - 3. conversion
            // non digit
            if char < "0" || char > "9" {
                // let int32 = Int32(sign + stringInt)
                return Int(sign + stringInt) ?? 0
            }
            
            // digit
            stringInt += "\(char)"
            
            // 4. rounding
            if Int32(sign + stringInt) == nil {
                if sign == "" {
                    return Int(Int32.max)
                } else if sign == "-" {
                    return Int(Int32.min)
                }
            }
        }
        
        return Int(sign + stringInt) ?? 0
    }
}