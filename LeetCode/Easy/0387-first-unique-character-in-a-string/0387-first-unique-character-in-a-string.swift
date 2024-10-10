class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var letterDict: [Character: Int] = [:]
        
        for (index, letter) in s.enumerated() {
            if let i = letterDict[letter] { // 앞에서 있었으면
                letterDict[letter] = -1
            } else { // 처음이면
                letterDict[letter] = index
            }
        }
        
        let minIndex = letterDict.filter { $0.value >= 0 }.map { $0.value }.min()
        
        return minIndex ?? -1
    }
}
