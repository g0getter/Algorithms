class Solution {
    func hammingWeight(_ n: Int) -> Int {
        // 정석: 2진수로 변환, 문자열 변환, 1 개수 세기
        // optimization: 
        
        // [2진수 변환]
        // i) 2^31 나누고 나머지에 대해 2^30으로 나누고, ...
        var count = 0
        var remainder = n
        // var i = 31
        // while (remainder > 0 && i > 0) {
        //     remainder = remainder % Int(pow(2, i))
        //     print(remainder)
        //     if remainder != 0 {
        //         count += 1
        //     }
        //     i-=1
        // }
        
        // ii) bitwise 연산자
        while remainder > 0 {
            count += remainder & 1 // 마지막 비트가 1이면 count 증가
            remainder >>= 1 // 오른쪽으로 한 비트 이동 // 1011 -> 101 -> 10 -> 1
        }
        return count
        
        // iii) swift 특징 이용
        // return String(n, radix: 2) // 2진수 변환
                // .filter { $0 == "1" }.count
    }
}