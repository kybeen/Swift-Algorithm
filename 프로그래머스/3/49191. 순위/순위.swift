import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var winList = [[Int]](repeating: [Int](), count: n+1) // winList[i] : i번 선수가 이기는 선수들
    var loseList = [[Int]](repeating: [Int](), count: n+1) // loseList[i] : i번 선수가 지는 선수들
    // results 기반으로 승패관계 구성
    for result in results {
        let winner = result[0]
        let loser = result[1]
        winList[winner].append(loser)
        loseList[loser].append(winner)
    }
    
    var visited = [Bool](repeating: false, count: n+1)
    var winCnt = [Int](repeating: 0, count: n+1) // i번 선수가 이기는 선수의 수
    var loseCnt = [Int](repeating: 0, count: n+1) // i번 선수가 지는 선수의 수
    
    // 특정 선수가 이기거나 지는 선수를 확인하는 함수
    func dfs(_ player: Int, _ now: Int, isWinnerCheck: Bool) {
        if isWinnerCheck {
            for w in winList[now] {
                if !visited[w] {
                    visited[w] = true
                    winCnt[player] += 1
                    dfs(player, w, isWinnerCheck: true)
                }
            }
        } else {
            for l in loseList[now] {
                if !visited[l] {
                    visited[l] = true
                    loseCnt[player] += 1
                    dfs(player, l, isWinnerCheck: false)
                }
            }
        }
    }
    
    // win, lose를 기반으로 알 수 있는 나머지 승패관계를 모두 구성하고 결과 확인
    var result = 0
    for player in 1...n {
        visited = [Bool](repeating: false, count: n+1)
        dfs(player, player, isWinnerCheck: true) // 이기는 선수들 확인
        visited = [Bool](repeating: false, count: n+1)
        dfs(player, player, isWinnerCheck: false) // 지는 선수들 확인
        if (winCnt[player] + loseCnt[player]) == n-1 {
            result += 1
        }
    }
    
    return result
}