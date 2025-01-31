class Solution {
    // Use Kadane's Algorithm, 'max subarray problem'
    // ref. Discuss(https://leetcode.com/explore/interview/card/top-interview-questions-easy/97/dynamic-programming/572/discuss/39038/Kadane's-Algorithm-Since-no-one-has-mentioned-about-this-so-far-:)-(In-case-if-interviewer-twists-the-input))
    // Exactly the same problem as getting a max subarray.
    func maxProfit(_ prices: [Int]) -> Int {
        // S: subtraction array of `prices`
        // S[i] = prices[i] - prices[i-1] (i>=1)
        // -> S의 연속된 부분합 중 최대가 정답. -> S에 대해 Kadane's Algorithm
        // -> `P[i]: S[i]의 연속된 부분합 중 최댓값(단, 반드시 S[i]는 포함)` 이라고 했을 때, 이 문제의 정답은 P 중 최댓값.
        // P 구하는 식? P[i] = max(P[i-1]+S[i], S[i]).
        
        // S 구하기
        var subtractions: [Int] = [0] // subtractions[i] = prices[i] - prices[i-1] (i>=1, prices[0] = 0)
        for i in 1..<prices.count {
            subtractions.append(prices[i]-prices[i-1])
        }

        // P 구하기
        var maxSub: [Int] = [0]
        for i in 1..<subtractions.count {
            maxSub.append(max(maxSub[i-1]+subtractions[i], subtractions[i])) // 초기화하거나, 이전의 최대에 자신을 더하거나
        }

        return maxSub.max() ?? 0
    }

    // Another version with Kadane's Algorithm, not using P array but maxSubSoFar(maxP)
    func maxProfit_maxSubSoFar(_ prices: [Int]) -> Int {
        // 개선: P 배열 대신 현재까지의 max인 p 사용

        // S 구하기
        var subtractions: [Int] = [0] // subtractions[i] = prices[i] - prices[i-1] (i>=1, prices[0] = 0)
        for i in 1..<prices.count {
            subtractions.append(prices[i]-prices[i-1])
        }

        // P 구하기(i단계의 maxSub가 P[i]임)
        var maxSub = 0
        // 현재까지의 max인 
        var maxSubSoFar = 0
        for i in 1..<subtractions.count {
            maxSub = max(maxSub+subtractions[i], subtractions[i]) // 초기화하거나, 이전의 최대에 자신을 더하거나
            maxSubSoFar = max(maxSub, maxSubSoFar) // Kadane's Algorithm과는 별개로 이 문제를 위한 단계
        }

        return maxSubSoFar
    }

    // first solution
    func maxProfit_firstSolution(_ prices: [Int]) -> Int {
        // 1. price 돌면서 min, max를 업데이트
        // 2. min, max가 바뀌면 profits index를 +1 후 profit에 넣음
        // 개선: profits 배열 대신 max인 profit 사용
        var minPrice = prices[0]
        var maxPrice = 0
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