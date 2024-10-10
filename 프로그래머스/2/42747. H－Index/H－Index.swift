import Foundation

func solution(_ citations:[Int]) -> Int {
    // 1. sort
    // 2. 중간값 선택(mid). 짝수개이면 살짝 큰 것
    // 3'. i=minIndex부터 시작, 본인 포함 우측 element 개수 >= citations[i] 시점에 Return (element 기준이 아니라 index 기준으로 세어야 건너뛰는 것 없이 가능)
    
    // h1번 이상 인용된 논문이 h2편 이상이고~
    let citations = citations.sorted() // 1
    
    // 2
    let midIndex = citations.count / 2
    
    // 3'.
    // (최대 h를 구해야한다면 h는 for문에서 점점 작아져야 하는데 citations.count - i 하면 점점 작아짐)
    for i in 0...midIndex {
        let h = citations.count - i // h2? h1?
        if citations[i] >= h { // TODO: h >= citations[i] 아닌 반대인 이유 생각
            print("o: \(citations[i]) >= \(h)")
            return h
        }
        print("x: \(citations[i]) >= \(h)")
    }
     return 0
    
    // ref: https://bada744.tistory.com/94
}