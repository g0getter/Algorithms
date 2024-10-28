class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count >= needle.count else { return -1 }
        
        if let range = haystack.range(of: needle) {
            return haystack.distance(from: haystack.startIndex, to: range.lowerBound)
        } else {
            return -1
        }
    }
    
    // FIXME: RUNTIME ERROR
    private func firstTry(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count >= needle.count else { return -1 }
        // Use two pointers
        // 1. If the first letter appears, start the 'needle loop'(checking if the needle appears)
        // 1-1. if it is the same, keep comparing the return the first index
        // 1-2. if it is not same, escape the loop and restart the loop with the current index
        var firstIndex = -1
        var currentIndex = 0
        
        let arrHaystack = Array(haystack)
        let arrNeedle = Array(needle)
        
        while currentIndex < arrHaystack.count {
            if arrHaystack[currentIndex] == arrNeedle.first {
                // start needle comparing loop
                firstIndex = currentIndex
                for (i, char) in arrNeedle.enumerated() {
                    if "\(char)" == "\(arrHaystack[currentIndex])" {
                        guard i != arrNeedle.count-1 else { return firstIndex } // end of the needle
                        // increase 1
                        currentIndex += 1
                    } else {
                        firstIndex = -1
                        currentIndex -= 2 // to prevent increasing
                        break
                    }
                }
            }
            currentIndex += 1
        }
        
        return firstIndex
    }
}