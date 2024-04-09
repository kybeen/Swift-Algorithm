import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0] // 세로 크기
let M = NM[1] // 가로 크기
var zido = [[Int]]()
for _ in 0..<N {
    zido.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var safeArea = N*M // 기본 지도에서의 안전영역 크기
for i in 0..<N {
    for j in 0..<M {
        if zido[i][j] != 0 {
            safeArea -= 1
        }
    }
}

var wallAddZido = zido // 벽 3개를 추가했을 때의 지도
var result = 0

// 벽 3개 세우기
func setWallDFS(_ now:(i:Int, j:Int), _ depth:Int) {
    // 3개 세웠으면 바이러스가 전파됐을 때 안전 영역 확인하기
    if depth == 3 {
        checkVirusBFS()
        return
    }
    
    // i와 j 이후만 확인
    for i in now.i..<N {
        let startJ = i==now.i ? now.j : 0
        for j in startJ..<M {
            if wallAddZido[i][j] == 0 {
                wallAddZido[i][j] = 1 // 벽 세우기
                setWallDFS((i, j), depth+1)
                wallAddZido[i][j] = 0
            }
        }
    }
}

// 바이러스 전파 후 안전영역 확인
func checkVirusBFS() {
    var virusZido = wallAddZido
    var nowSafeArea = safeArea - 3 // 새로 세운 벽 3개 제외
    var idx = 0
    var queue = [(i:Int, j:Int)]()
    
    let di = [-1, 1, 0, 0]
    let dj = [0, 0, -1, 1]
    
    // 바이러스 시작점
    for i in 0..<N {
        for j in 0..<M {
            if virusZido[i][j] == 2 {
                queue.append((i,j))
            }
        }
    }
    
    while idx < queue.count {
        let now = queue[idx]
        
        for k in 0..<4 {
            let new_i = now.i + di[k]
            let new_j = now.j + dj[k]
            
            if new_i < 0 || new_j < 0 || new_i >= N || new_j >= M {
                continue
            }
            if virusZido[new_i][new_j] == 0 {
                virusZido[new_i][new_j] = 2
                queue.append((new_i, new_j))
                nowSafeArea -= 1 // 안전영역 크기 계산 (바이러스가 퍼졌기 때문에 1 감소)
            }
        }
        
        idx += 1
    }
    
    result = max(result, nowSafeArea) // 안전 영역의 최대 크기 갱신
}

setWallDFS((0, 0), 0) // 벽 3개 세우기

print(result)