class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // 1. price 돌면서 min, max를 업데이트
        // 2. min, max가 바뀌면 prfits index를 +1 후 profit에 넣음
        
        var min = prices[0]
        var max = 0
        var profits: [Int] = []
        
        for price in prices {
            if price < min {
                // update min, empty max
                min = price
                max = -1 // means 'empty'
            } else if price > max {
                max = price
                if max - min > 0 {
                    profits.append(max - min)
                }
            }
        }
        
        return profits.max() ?? 0
        
    }
}