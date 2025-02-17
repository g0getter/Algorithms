class Solution {
    func hammingWeight(_ n: Int) -> Int {
        // 정석: 2진수로 변환, 문자열 변환, 1 개수 세기
        // optimization: 
        
        // 2진수 변환
        // 2^31 나누고 나머지에 대해 2^30으로 나누고, ...
        // or
        // swift 특징 이용
        return String(n, radix: 2) // 2진수 변환
                .filter { $0 == "1" }.count
    }
}