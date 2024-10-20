import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    // 이전의 결과값 사용!!!
    
    /// result[i]: N을 i+1번 이용해서 만들 수 있는 수
    // result[2]: NN, result[0] <op> result[1], result[1] <op> result[0]
    // result[3]: NNN, result[0] <op> result[2], result[1] <op> result[1], ...
    var result: [Set<Int>] = []
    var i = 0
    
    while (i < 8) {
        // 연속된 N (NN...N)
        var consecutiveN = ""
        for _ in 0...i {
            consecutiveN = consecutiveN + "\(N)"
        }
        let intConsecutiveN = Int(consecutiveN) ?? 0
        result.append([intConsecutiveN])
        // 점검 (1)
        if result[i].contains(number) {
            return i + 1 // 더 진행할 필요 없이 return
        }
        
        // operations
        let maxIndex = i - 1
        guard maxIndex >= 0 else { 
            i += 1
            continue 
        }
        
        for index in 0...maxIndex {
            for a in result[index] {
                for b in result[i-index-1] {
                    result[i].insert(a + b) // +
                    result[i].insert(a - b) // -
                    result[i].insert(b - a) // -
                    result[i].insert(a * b) // *
                    guard b != 0 else { continue }
                    result[i].insert(a / b) // /
                    guard a != 0 else { continue } // a!=0, b=0일 경우 여기까지 오지 않지만 그럴 경우 b/a = 0의 값이 곱셈에서 이미 추가되었기 때문에 커버됨
                    result[i].insert(b / a) // /
                }
            }
        }
        
        result[i] = result[i].filter { $0 >= 0 } // 음수 제거
        
        // 점검 (2)
        if result[i].contains(number) {
            return i + 1 // 더 진행할 필요 없이 return
        }
        
        i += 1
    }
    
    return -1
}

// ref: https://velog.io/@euneun/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4-N%EC%9C%BC%EB%A1%9C-%ED%91%9C%ED%98%84-DP-%EB%8F%99%EC%A0%81%EA%B3%84%ED%9A%8D%EB%B2%95-C
