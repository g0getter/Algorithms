class BalancedWorld {
    
    // FOR SUBMITION
    func solution() {
        // 0. Get a line
        // 입력값을 줄 단위로 분리하여 배열로 저장
        while let line = readLine(), line != "." {
            print(determineBalance(line) ? "yes" : "no")
        }
        
//        for line in lines {
//            print(determineBalance(line) ? "yes" : "no")
//        }
        
        // 1. Explore each character
        // 2. when you meet ")" or "]", pop the stack
        // 3. if there's nothing to pop, print false
        // 4. if all are explored and stacks are empty, return true
        
    }
    
    private func determineBalance(_ sentence: String) -> Bool {
//        print(sentence)
        
        var parenStack = Stack<Int>()
        var bracketStack = Stack<Int>()
        var order = 0
        
        for char in sentence {
            switch char {
            case "(":
                parenStack.push(order)
                order += 1
            case ")":
                guard let lastParen = parenStack.pop(),
                      lastParen > (bracketStack.peek() ?? -1)
                else {
                    return false
                }
            case "[":
                bracketStack.push(order)
                order += 1
            case "]":
                guard let lastBracket = bracketStack.pop(),
                      lastBracket > (parenStack.peek() ?? -1)
                else {
                    return false
                }
            default: break
            }
            
        }
        
        if parenStack.isEmpty && bracketStack.isEmpty {
            return true
        }
        
        return false
    }
}

struct Stack<T> {
    var items: [T] = []
    var isEmpty: Bool {
        items.isEmpty
    }
    
    mutating func push(_ element: T) {
        items.append(element)
    }
    
    mutating func pop() -> T? {
        return items.popLast()
    }
    
    func peek() -> T? {
        items.last
    }
}

BalancedWorld().solution()
