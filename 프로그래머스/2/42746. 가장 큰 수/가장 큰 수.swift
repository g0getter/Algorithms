import Foundation

func solution(_ numbers:[Int]) -> String {
    var stringNumbers = numbers.map { "\($0)" }
    
    stringNumbers.sort { a, b in
        let ab = a + b
        let ba = b + a
                                
        return Int(ab) ?? 0 > Int(ba) ?? 0
    }
    
    // Convert consecutive 0s to 0
    // (i) Use Type casting(String->Int->String)
    // var stringNumber = stringNumbers.reduce("", +)
    // let intNumber = Int(stringNumber) ?? 0
    // print("\(intNumber)")
    // return "\(Int(stringNumber) ?? 0)"
    
    // (ii) Check the first element
    if stringNumbers.first == "0" {
        return "0"
    }
    
    return stringNumbers.reduce("", +)
}