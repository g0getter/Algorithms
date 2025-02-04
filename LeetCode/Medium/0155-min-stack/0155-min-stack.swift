// Solution(Hint+Discuss/Swift) using a Tuple in the stack having a minimum value.
class MinStack {
    private var stack: [(val: Int, min: Int)] = []

    init() {
    }
    
    func push(_ val: Int) {
        let lastMin = stack.last?.min ?? Int.max
        stack.append((val: val, min: lastMin > val ? val : lastMin))
    }
    
    func pop() {
        stack.removeLast()
    }
    
    func top() -> Int {
        stack.last?.val ?? Int.max
    }
    
    func getMin() -> Int {
        stack.last?.min ?? Int.max
    }
}
// Solution(Hint+Discuss) using a node having a minimum value.
class MinStack_Node {
    private var node: Node?

    class Node { // cannot be struct due to a recursive issue
        var val: Int
        var next: Node?
        var min: Int // minimum so far, including a current node itself

        init(val: Int, next: Node?, min: Int) {
            self.val = val
            self.next = next
            self.min = min
        }
    }

    init() {
    }
    
    func push(_ val: Int) {
        let previousNode = node
        let previousMin = previousNode?.min ?? Int.max
        node = Node(val: val, next: previousNode, min: (previousMin > val ? val : previousMin))
    }
    
    func pop() {
        guard let previousNode = node else { return }
        node = previousNode.next
    }
    
    func top() -> Int {
        guard let node = node else { return Int.max }
        return node.val
    }
    
    func getMin() -> Int {
        return node?.min ?? -1
    }
}

// My solution not using a node
class MinStack_solution1 {
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