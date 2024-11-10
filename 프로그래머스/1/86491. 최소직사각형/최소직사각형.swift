import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    // 1. 더 긴 쪽을 가로로 해둔 배열 생성
    // 2. 각각의 max를 반환
    
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