import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    // solution1(sizes)
    solution2(sizes)
}

/// 1. 더 긴 쪽을 가로로 해둔 배열 생성
/// 2. 각각의 max를 반환
func solution1(_ sizes:[[Int]]) -> Int {
    let newSizes: [[Int]] = sizes
    .map { size in
          guard let max = size.max(),
          let min = size.min() else { return [-1] }
          return [max, min]
         }
    
    let width = newSizes.compactMap { $0.first }.max() ?? -1
    let height = newSizes.compactMap { $0.last }.max() ?? -1
    
    return width * height
}

/// 새로운 배열 만들 필요 없이 항목 돌 때마다 max 값을 갱신
func solution2(_ sizes:[[Int]]) -> Int {
    var maxWidth = 0
    var maxHeight = 0
    
    for size in sizes {
        maxWidth = max(maxWidth, size.max() ?? -1)
        maxHeight = max(maxHeight, size.min() ?? -1)
    }
    
    return maxWidth * maxHeight
}