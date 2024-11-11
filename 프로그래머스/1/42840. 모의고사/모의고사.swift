import Foundation

func solution(_ answers:[Int]) -> [Int] {
    // firstSolution(answers)
    secondSolution(answers)
}

// answerCounts -> dictionary 사용
private func secondSolution(_ answers:[Int]) -> [Int] {
    // 1, 2, 3 최소 배열 각각 생성
    let firstRule = [1, 2, 3, 4, 5]
    let secondRule = [2, 1, 2, 3, 2, 4, 2, 5]
    let thirdRule = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var answerCounts = [1: 0, 2: 0, 3: 0]
    
    // answers 돌면서 각 사람별 정답 개수 증가
    for (i, answer) in answers.enumerated() {
        if answer == firstRule[i%firstRule.count] {
            answerCounts[1]! += 1
        }
        if answer == secondRule[i%secondRule.count] {
            answerCounts[2]! += 1
        }
        if answer == thirdRule[i%thirdRule.count] {
            answerCounts[3]! += 1
        }
    }
    
    // max()와 같은 index로 이루어진 배열 만들기(+오름차순 정렬)
    let winners = answerCounts.sorted { $0.key < $1.key }
    .filter { $0.value == answerCounts.values.max() }
    .map { $0.key }

    return winners
}

private func firstSolution(_ answers:[Int]) -> [Int] {
    // 1, 2, 3 최소 배열 각각 생성
    let firstRule = [1, 2, 3, 4, 5]
    let secondRule = [2, 1, 2, 3, 2, 4, 2, 5]
    let thirdRule = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var firstAnswerCount = 0
    var secondAnswerCount = 0
    var thirdAnswerCount = 0
    
    // answers 돌면서 각 사람별 정답 개수 증가
    for (i, answer) in answers.enumerated() {
        if answer == firstRule[i%firstRule.count] {
            firstAnswerCount += 1
        }
        if answer == secondRule[i%secondRule.count] {
            secondAnswerCount += 1
        }
        if answer == thirdRule[i%thirdRule.count] {
            thirdAnswerCount += 1
        }
    }
    
    // max()와 같은 index로 이루어진 배열 만들기(자동 오름차순 정렬)
    let answerCounts = [firstAnswerCount, secondAnswerCount, thirdAnswerCount]
    
    let winners = answerCounts.indices
    .filter { answerCounts[$0] == answerCounts.max() }
    .map { $0 + 1 }

    return winners
}