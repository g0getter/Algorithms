
class MinStack {
    private var stack: [Int]
    private var minimum = Int.max
    
    init() {
        stack = []
    }
    
    func push(_ val: Int) {
        stack.append(val)
        
        if minimum > val {
            minimum = val
        }
    }
    
    func pop() {
        let last = stack.removeLast()
        if minimum == last {
            minimum = stack.min() ?? Int.max
        }
    }
    
    func top() -> Int {
        stack.last ?? Int.min // always has the last element though
    }
    
    func getMin() -> Int {
        minimum
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