import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var board = [[Character]]()
// board의 테두리를 x로 둘러싸준다.
board.append([Character](repeating: "x", count: M+2))
for _ in 0..<N {
    var row = Array(readLine()!)
    row.insert("x", at: 0)
    row.append("x")
    board.append(row)
}
board.append([Character](repeating: "x", count: M+2))

var coins = [(Int, Int)]()
// 동전 위치 coins에 저장
for i in 0..<N+2 {
    for j in 0..<M+2 {
        if board[i][j] == "o" {
            coins.append((i, j))
        }
    }
}

let di = [-1, 1, 0, 0]
let dj = [0, 0, -1, 1]

var idx = 0
var queue = [(Int, Int, Int, Int, Int)]() // (동전1_i, 동전1_j, 동전2_i, 동전2_j , 버튼누른횟수)
queue.append((coins[0].0, coins[0].1, coins[1].0, coins[1].1, 0))

func bfs() {
    while idx < queue.count {
        let now = queue[idx]
        let coinA = (now.0, now.1)
        let coinB = (now.2, now.3)
        
        // 버튼을 누른 횟수가 10을 넘어가면 -1 출력 후 종료
        if now.4 > 10 {
            print(-1)
            return
        }
        // 동전 2개가 모두 떨어지는 경우는 패스
        if board[coinA.0][coinA.1] == "x" && board[coinB.0][coinB.1] == "x" {
            idx += 1
            continue
        } else if board[coinA.0][coinA.1] == "x" { // 동전1만 떨어지는 경우
            print(now.4)
            return
        } else if board[coinB.0][coinB.1] == "x" { // 동전2만 떨어지는 경우
            print(now.4)
            return
        }
        
        for k in 0..<4 {
            var new_ai = coinA.0 + di[k]
            var new_aj = coinA.1 + dj[k]
            
            var new_bi = coinB.0 + di[k]
            var new_bj = coinB.1 + dj[k]
            
            // 동전 1,2 모두 벽에 막혀서 이동할 수 없으면 패스
            if board[new_ai][new_aj] == "#" && board[new_bi][new_bj] == "#" {
                continue
            } else if board[new_ai][new_aj] == "#" { // 동전1만 벽에 막혀있는 경우
                new_ai = coinA.0
                new_aj = coinA.1
            } else if board[new_bi][new_bj] == "#" { // 동전2만 벽에 막혀있는 경우
                new_bi = coinB.0
                new_bj = coinB.1
            }
            
            queue.append((new_ai, new_aj, new_bi, new_bj, now.4+1))
        }
        
        idx += 1
    }
    
    print(-1)
    return
}

bfs()