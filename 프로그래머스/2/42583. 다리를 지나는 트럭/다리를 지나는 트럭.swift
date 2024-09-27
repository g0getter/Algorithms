import Foundation

// Key idea
// ✅1. `bridge` 만들어 append, remove하며 실제 다리 구현
// ✅2. trucks_weights가 비면 그 시점으로부터 + bridge_length가 결과
// ✅3. loop 마다 할 것: 현재 다리의 weight + trucks_weights.peek() 후 최대 무게를 넘지 않으면 상태(현재 다리의 weight, `bridge` 현황) 업데이트

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridge = [Int](repeating: 0, count: bridge_length) // 실제 다리(진행방향 <-)
    var truck_weights = truck_weights // mutable `truck_weights`
    var time = 0
    var currentWeight = 0 // 없이 reduce 사용 시 시간 초과됨
    
    while(truck_weights.count > 0) {
        guard let firstTruck = truck_weights.first else { break }
        
        currentWeight -= bridge.removeFirst() // (1) 나갈 트럭은 일단 내보냄
        // (2) 그 다음 트럭을 받을지 말지 결정
        if currentWeight + firstTruck <= weight { // passed
            bridge.append(truck_weights.removeFirst()) // 트럭 받고
            currentWeight += firstTruck // 현재 무게 업데이트
        } else { // exceeded!
            bridge.append(0) // 트럭 받지 않음
        }
        
        // print(bridge)
        
        time += 1
    }
    
    return time + bridge_length
}