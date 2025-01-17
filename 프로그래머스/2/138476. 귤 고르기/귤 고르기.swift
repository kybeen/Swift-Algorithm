import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var tangerineDict = [Int: Int]() // 귤 크기 별 개수
    for t in tangerine {
        tangerineDict[t, default: 0] += 1
    }
    
    // 개수 많은 크기 순서대로 정렬
    let sortedByCount = tangerineDict.sorted {
        $0.value > $1.value
    }.map(\.value)
    
    // 개수 많은 크기부터 상자에 담기
    var k = k
    var result = 0
    for count in sortedByCount {
        guard k > 0 else { break }
        k -= count
        result += 1
    }
    
    return result
}