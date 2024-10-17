import Foundation

func solution(_ operations:[String]) -> [Int] {
    // queue
    // 1. insert - insert
    // 2. D 1, D -1 -> sort & delete
    var queue: [Int] = []
    
    for operation in operations {
        let action = operation.components(separatedBy: " ").first ?? ""
        let value = operation.components(separatedBy: " ").last ?? ""
        // print(value)
        if action == "I" {
            queue.append(Int(value) ?? 0)
        } else { // "D"
            guard queue.count > 0 else { continue } // 빈 큐이면 연산 무시
            queue.sort()
            
            if value == "1" {
                queue.removeLast()
            } else { // value == "-1"
                queue.removeFirst()
            }
        }
        // print(queue)
    }
    
    guard let max = queue.max(),
    let min = queue.min() else { return [0, 0] }
    return [max, min]
}

// 이중 우선순위 큐 구현 - heap 이용
// heap 구현: struct
// func heapSolution(_ operations:[String]) -> [Int] {}
// struct MaxHeap: Heap {
//     func insert() {
        
//     }
// } 