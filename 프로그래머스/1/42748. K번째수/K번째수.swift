import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    // 1. Make a subarray
    // 2. Sort - (i) Use built-in sort func or (ii) manually
    // 3. Pick k-th element
    // 4. Wrap with a loop
    var result: [Int] = []
    
    for command in commands {
        result.append(getKthNumber(command, array))
    }
    
    return result
}

func getKthNumber(_ command: [Int], _ array: [Int]) -> Int {
    guard command.count == 3 else { return -1 }
    
    let i = command[0]
    let j = command[1]
    let k = command[2]
    
    var subarray = array[i-1..<j]
    let index = subarray.startIndex + (k-1) 
                // subarray.startIndex != 0 (not always)
    
    subarray.sort()
    
    return subarray[index]
}