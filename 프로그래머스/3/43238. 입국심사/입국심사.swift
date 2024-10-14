import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var minTime = n/times.count // 가능(?)한, 상상할 수 있는 최솟값. n보다 작을 수도 있음(e.g. n=100, [1, 1])
    var maxTime = n * (times.max() ?? 0)
    
    var possibleTimes: [Int] = []
    
    for i in 0...maxTime-minTime {
        var people = 0
        let midTime = (minTime + maxTime) / 2
        for time in times {
            people += midTime / time // time 심사대에서 처리한 인원 수
        }
        
        if people >= n { // 충분 (주의: 등호가 >와 함께 있어야 답이 나옴)
            maxTime = midTime // 범위 줄임
        } else {
            minTime = midTime
        }
        
        if people == n {
            if possibleTimes.contains(midTime) {
                return Int64(possibleTimes.min() ?? -1)
            } else {
                possibleTimes.append(midTime)
            }
        }
        
        if minTime + 1 == maxTime {
            return Int64(maxTime)
        }
        
        // print("minTime: \(minTime), maxTime: \(maxTime), possibleTimes: \(possibleTimes)")
    }

    return Int64(possibleTimes.min() ?? -1)
}

