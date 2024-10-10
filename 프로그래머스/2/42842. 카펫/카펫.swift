import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let sumOfRowAndColumn = ( brown - 4 ) / 2 // -4: 네 꼭짓점
    
    for column in 1...sumOfRowAndColumn/2 {
        let row = sumOfRowAndColumn - column
        if row * column == yellow {
            return [row+2, column+2] // +2: 두 꼭짓점
        }
    }
    
    return []
}