//
//  2573.swift
//  Algorithms
//
//  Created by 여나경 on 1/25/25.
//
// FIXME: 
import Foundation

class IceBerg: Solution {
    var visitedGrid: [[Bool]] = []
    var grid: [[Int]] = []
    var n: Int = 0
    var m: Int = 0

    func solution(_ input: String) -> Int {
//        print(input)

        // read input
        (grid, n, m) = readInput(input)

        /// 0(ice) would be visitied(true), while others wouldn't be.
        visitedGrid = grid.compactMap { line in
            let newLine = line.compactMap { $0 > 0 ? false : true }
            return newLine
        }
        // 1. 녹임
        // 2. 덩어리 개수 확인
        // 3. 혹시 다 0이면 return 0

        var time = 0

        while true {
            // 1. 녹임 (15min)
            // TODO: 4면이 0인지 확인해서 줄이도록 수정
            var melt = Array(repeating: Array(repeating: 0, count: m), count: n)
            for i in 0..<n {
                for j in 0..<m {
                    if grid[i][j] > 0 {
                        exploring(from: (i, j)) { x, y in
                            if grid[x][y] == 0 {  // 주변이 얼음이면
                                melt[i][j] += 1
                            }
                        }
                    }
                }
            }
            var newGrid = grid
            for i in 0..<n {
                for j in 0..<m {
                    newGrid[i][j] = max(0, grid[i][j] - melt[i][j])
                }
            }
            time += 1
//            printGrid(newGrid)

            grid = newGrid
            //            print("Updated grid:", grid)

            // 2. 덩어리 개수 확인
            var chunkCount = 0
            visitedGrid = Array(
                repeating: Array(repeating: false, count: m), count: n)
            for (i, line) in newGrid.enumerated() {
                for (j, position) in line.enumerated() {
                    if position > 0, visitedGrid[i][j] == false {  // 얼음이 아니고 방문하지 않았음
                        // change to visited and start searching
                        exploring(from: (i, j))
                        // -> finished 1 exploration
                        chunkCount += 1
                    }
                }
            }

            if chunkCount > 1 {
                return time
            } else if chunkCount == 0 {
                return 0
            }
            // 1 -> keep going
        }

        return -1
    }
}

extension IceBerg {

    private func exploring(
        from position: (Int, Int), completion: (Int, Int) -> Void
    ) {
        let (i, j) = position

        // exploring 4 sides
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        for (x, y) in directions {
            let newX = i + x
            let newY = j + y
            if newX >= 0 && newX < n && newY >= 0 && newY < m {
                completion(newX, newY)
            }
        }
    }

    private func exploring(from position: (Int, Int)) {
        let (i, j) = position
        // change visited status
        visitedGrid[i][j] = true  // global variable!!!

        // exploring 4 sides
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        for (x, y) in directions {
            let newX = i + x
            let newY = j + y
            if newX >= 0 && newX < n && newY >= 0 && newY < m {
                if grid[newX][newY] > 0, visitedGrid[newX][newY] == false {
                    exploring(from: (newX, newY))
                }
            }

        }
    }

    private func readInput(_ input: String) -> ([[Int]], Int, Int) {
        // 문자열을 줄 단위로 분리
        let lines = input.split(separator: "\n").map { String($0) }

        // 첫 번째 줄에서 N, M 추출
        let firstLine = lines[0].split(separator: " ").map { Int($0)! }
        let n = firstLine[0]
        let m = firstLine[1]

        // 나머지 줄에서 2차원 배열 생성
        let grid = lines[1...].map { line in
            line.split(separator: " ").map { Int($0)! }
        }

        return (grid, n, m)  // 2차원 배열, N, M 반환
    }
}

extension IceBerg {
    func printGrid(_ grid: [[Int]]) {
        let string =
            grid
            .map { row in
                return row.reduce("") { "\($0) \($1)" }
            }.reduce("") { "\($0)\n\($1)" }

        print(string)
    }
}
