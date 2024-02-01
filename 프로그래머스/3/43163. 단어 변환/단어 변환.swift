import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target) else { return 0 }
    
    // 두 단어를 비교해서 알파벳 하나만 다른지 확인하는 함수
    func compWords(_ a: String, _ b: String) -> Bool {
        var diffCnt = 0
        // String을 인덱스로 접근하기 위해 배열로 변환
        let arrA = Array(a)
        let arrB = Array(b)
        for i in 0..<a.count {
            if arrA[i] != arrB[i] {
                diffCnt += 1
            }
        }
        return diffCnt == 1
    }
    
    var visited = [Bool](repeating: false, count: words.count)
    var result = Int.max
    func dfs(_ now: String, _ depth: Int) {
        // 현재 depth가 result보다 커지면 더 탐색할 필요가 x
        guard depth < result else { return }
        
        // target이 되면 최소 단계 갱신
        if now == target {
            result = min(result, depth)
        }
        
        for i in 0..<words.count {
            if !visited[i] {
                // 방문하지 않은 단어 중 현재 단어와 알파벳 한글자만 다른 단어가 있다면 탐색
                if compWords(now, words[i]) {
                    visited[i] = true
                    dfs(words[i], depth+1)
                    visited[i] = false
                }
            }
        }
    }
    dfs(begin, 0)

    return result
}