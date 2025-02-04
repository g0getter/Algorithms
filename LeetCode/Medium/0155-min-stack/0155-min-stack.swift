
class MinStack {
    private var stack: [Int]
    
    init() {
        stack = []
    }
    
    func push(_ val: Int) {
        stack.append(val)
    }
    
    func pop() {
        stack.removeLast()
    }
    
    func top() -> Int {
        stack.last ?? Int.min // always has the last element though
    }
    
    func getMin() -> Int {
        stack.min() ?? Int.min
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */