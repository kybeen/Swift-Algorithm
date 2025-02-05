import Foundation

func solution(_ s:String) -> Int {
    guard s.count > 1 else { return 1 }
    let s = Array(s)
    
    var result = Int.max
    // 각 길이 별
    for len in 1...s.count/2 {
        // 압축 문자열 만들기
        var compressed: String = "" // 압축된 문자열
        var nowPattern = String(s[0..<len]) // 현재 압축중인 패턴
        var nowCompressCount = 1 // 현재 압축 횟수
        
        var idx = len
        while idx <= (s.count-len) {
            let subStr = String(s[idx..<idx+len])
            
            if subStr == nowPattern {
                nowCompressCount += 1
            } else {
                let countedPattern = (nowCompressCount == 1) ? nowPattern : "\(nowCompressCount)\(nowPattern)"
                compressed += countedPattern
                nowPattern = subStr
                nowCompressCount = 1
            }
            idx += len
        }
        
        // 나머지 처리
        let countedPattern = (nowCompressCount == 1) ? nowPattern : "\(nowCompressCount)\(nowPattern)"
        compressed += countedPattern
        compressed += String(s[idx..<s.count])
        
        result = min(result, compressed.count)
    }
    
    return result
}