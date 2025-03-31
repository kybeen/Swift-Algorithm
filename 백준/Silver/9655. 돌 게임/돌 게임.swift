enum Player: String {
    case sk = "SK"
    case cy = "CY"
}

let N = Int(readLine()!)!
var answer: String?

func dfs(_ player: Player, _ stones: Int) {
    guard answer == nil else { return } // 답이 구해졌으면 그만 탐색함
    
    if stones == 0 { // 돌의 개수가 딱 0이 되면 정답 구하기
        // 이전 차례 player가 정답이 됨
        let winner: Player = (player == .sk) ? .cy : .sk
        answer = winner.rawValue
        return
    } else if stones < 0 {
        return
    } else {
        if player == .sk {
            dfs(.cy, stones - 1)
            dfs(.cy, stones - 3)
        } else {
            dfs(.sk, stones - 1)
            dfs(.sk, stones - 3)
        }
    }
}

dfs(.sk, N)
print(answer ?? "")