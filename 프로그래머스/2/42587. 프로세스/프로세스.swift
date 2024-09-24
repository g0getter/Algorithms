import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var dynamicLocation = location // varies according to the current location
    var dynamicPriorities = priorities
    var currentOrder = 1
    
    while dynamicPriorities.count > 0 { // 사실상 의미x. 익셉션 방지용
        let currentPriority = dynamicPriorities.removeFirst()
        
        if isTheMostPriorProcess(currentPriority, among: dynamicPriorities) {
            // Execute
            
            // currentOrder += 1
            // if it is it, return
            if dynamicLocation == 0 {
                return currentOrder
            } else { // if not, update the locaton(index)
                dynamicLocation -= 1
            }
            currentOrder += 1
        } else {
            // append
            dynamicPriorities.append(currentPriority)
            dynamicLocation = (dynamicLocation + dynamicPriorities.count - 1) % dynamicPriorities.count
        }
        
        // if the process is executed, return immediately(ABOVE)
        
        
        // dynamicLocation = index(ABOVE)
    }
    return -1 //currentOrder  // 실행 안될 것
}

/// Check if its priority is the biggest (priorities에 priority 포함 X)
func isTheMostPriorProcess(_ priority: Int, among priorities:[Int]) -> Bool {
    guard let max = priorities.max() else { return true }
    return priority >= max
}