import Foundation

func solution(_ s:String) -> Bool
{
    var ans:Bool = false
    // Sol1. 정수 변수 생성, 0 되면 true, 음수가 한 번이라도 나오면 즉시 false
    var parenthesisNum = 0
    
    for char in s {
        if char == "(" {
            parenthesisNum += 1
        } else {
            parenthesisNum -= 1
        }
        if parenthesisNum < 0 {
            return false
        }
    }
    
    ans = (parenthesisNum == 0)
    
    // Sol2. ( 전용 스택 생성, ) 나오면 pop, 뺄 게 없는 경우 즉시 false
    return ans
}