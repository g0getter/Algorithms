//
//  10845.swift
//  Algorithms
//
//  Created by 여나경 on 2/6/25.
//

// Same code with a submitted version but with different input handling
class Queue: Solution {
    func solution(_ input: String) -> String {
        // 입력값을 줄 단위로 분리하여 배열로 저장
        let lines = input.split(separator: "\n").map { String($0) }

        // 첫 번째 줄: 명령의 개수
        let n = Int(lines[0])! // 명령의 개수

        var queue = Queue<Int>() // 정수를 저장하는 큐 생성
        var results: [String] = [] // 출력 결과를 저장할 배열
        
        print("<INPUT>")
        for i in 1...n {
            let command = lines[i].split(separator: " ")

//            print("command[0]: \(command[0]), command[1]: \(command[1])")
            switch command[0] {
            case "push":
                if let value = Int(command[1]) {
                    queue.push(value)
                }
            case "pop":
                results.append(queue.pop().map{ "\($0)" } ?? "-1")
            case "size":
                results.append("\(queue.size())")
            case "empty":
                results.append(queue.isEmpty() ? "1" : "0")
            case "front":
                results.append(queue.front().map { "\($0) "} ?? "-1")
            case "back":
                results.append(queue.back().map { "\($0) "} ?? "-1")
            default:
                break
            }
        }

        // 결과 출력 (한 번에 출력하여 성능 최적화)
        return results.joined(separator: "\n")
    }
    
    // 큐 구현을 위한 구조체
    struct Queue<T> {
        private var elements: [T] = []

        // 큐에 요소 추가
        mutating func push(_ value: T) {
            elements.append(value)
        }

        // 큐에서 가장 앞의 요소 제거 및 반환
        mutating func pop() -> T? {
            self.isEmpty() ? nil : elements.removeFirst()
        }

        // 큐의 크기 반환
        func size() -> Int {
            return elements.count
        }

        // 큐가 비어있는지 확인
        func isEmpty() -> Bool {
            return elements.isEmpty
        }

        // 큐의 가장 앞의 요소 반환
        func front() -> T? {
            return elements.first
        }

        // 큐의 가장 뒤의 요소 반환
        func back() -> T? {
            return elements.last
        }
    }

}
