import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    // [X] 전체 합에서 target을 빼고 남은 짝수를 반반 분리하고 그 안에서 정렬하는 경우의 수
    // [O] tree + BFS. 모든 경우의 수를 leaves에 넣고 target과 같은 개수 반환
    // TODO: DFS
    
    var leaves = [0]
    var count = 0
    
    for num in numbers {
        var temp: [Int] = []
        
        for leaf in leaves {
            temp.append(leaf + num)
            temp.append(leaf - num)
        }
        
        leaves = temp
    }
    
    return leaves.filter { $0 == target}.count ?? 0
}

// ref: https://daeun-computer-uneasy.tistory.com/69