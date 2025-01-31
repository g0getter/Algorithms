class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // 1. price 돌면서 min, max를 업데이트
        // 2. min, max가 바뀌면 profits index를 +1 후 profit에 넣음
        // 개선: profits 배열 대신 max인 profit 사용
        var minPrice = prices[0]
        var maxPrice = 0
        // var profits: [Int] = []
        var maxProfit = 0
        
        for price in prices {
            if price < minPrice {
                // update min, empty max
                minPrice = price
                maxPrice = -1 // means 'empty'
            } else if price > maxPrice {
                maxPrice = price
                maxProfit = max(maxProfit, maxPrice - minPrice) ?? 0
            }
        }
        
        return maxProfit
    }
}