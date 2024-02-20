import Foundation

let N = Int(readLine()!)!
var coins = [[Character]]()
for _ in 0..<N {
    coins.append(Array(readLine()!))
}

extension Character {
    mutating func flip() {
        if self == "T" {
            self = "H"
        } else {
            self = "T"
        }
    }
}
// 행 뒤집는 함수
func flipRow(_ row: Int) {
    for j in 0..<N {
        coins[row][j].flip()
    }
}
// 현재 상태에서 뒷면이 최소가 되도록 열을 뒤집었을 때 뒷면의 개수를 구하는 함수
func getTCount() -> Int {
    var numberOfT = 0 // 뒷면 개수
    let half = N / 2 // 해당 열의 뒷면이 절반을 넘으면 뒤집어줘야 함
    
    // 각 열에 대해 뒷면의 개수를 확인하고 절반 넘게 뒷면이면 뒤집었을 떄의 뒷면 개수를 더해준다.
    for j in 0..<N {
        var cnt = 0
        for i in 0..<N {
            if coins[i][j] == "T" {
                cnt += 1
            }
        }
        
        if cnt > half {
            numberOfT += abs(N - cnt)
        } else {
            numberOfT += cnt
        }
    }
    
    return numberOfT
}

var result = 400
func dfs(_ nowRow: Int) {
    if nowRow == N {
        // 열을 뒤집으면서 얻을 수 있는 최소 뒷면 개수 갱신
        result = min(result, getTCount())
        return
    }
    
    // 현재 행을 뒤집지 않는 경우
    dfs(nowRow+1)
    // 현재 행을 뒤집는 경우
    flipRow(nowRow)
    dfs(nowRow+1)
    flipRow(nowRow)
}

dfs(0)
print(result)