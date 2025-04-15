import Foundation

struct Point: Equatable {
    let i: Int
    let j: Int
    
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
}

let NM = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])
var board = [[Character]]()
let paddingRow: [Character] = Array(repeating: "x", count: M+2)
board.append(paddingRow)
for _ in 0..<N {
    let row = ["x"] + Array(readLine()!) + ["x"]
    board.append(row)
}
board.append(paddingRow)
//board.forEach { print($0) }

// 두 동전의 시작 좌표
var ab = [Point]()
for i in 0...N+1 {
    for j in 0...M+1 {
        if board[i][j] == "o" {
            ab.append(Point(i, j))
        }
    }
}

let di = [-1, 1, 0, 0]
let dj = [0, 0, -1, 1]

// BFS 탐색
var answer = -1
var idx = 0
var queue = [(a: Point, b: Point, count: Int)]()
queue.append((ab[0], ab[1], 0))

while idx < queue.count {
    let (a, b, count) = queue[idx]
    if count > 10 { break }
    
    let isAOut = (a.i == 0 || a.i == N+1 || a.j == 0 || a.j == M+1)
    let isBOut = (b.i == 0 || b.i == N+1 || b.j == 0 || b.j == M+1)
    
    if isAOut && isBOut {
        idx += 1 // continue 전에 인덱스 증가 까먹으면 안됨
        continue
    } else if isAOut && !isBOut { // A 동전만 나가는 경우
        answer = count
        break
    } else if !isAOut && isBOut { // B 동전만 나가는 경우
        answer = count
        break
    }
    
    for k in 0..<4 {
        var nextA = Point(a.i+di[k], a.j+dj[k])
        var nextB = Point(b.i+di[k], b.j+dj[k])
        
        guard nextA.i >= 0 && nextA.j >= 0 && nextA.i <= N+1 && nextA.j <= M+1 else { continue }
        guard nextB.i >= 0 && nextB.j >= 0 && nextB.i <= N+1 && nextB.j <= M+1 else { continue }
        
        if board[nextA.i][nextA.j] == "#" {
            nextA = a
        }
        if board[nextB.i][nextB.j] == "#" {
            nextB = b
        }
        if !(nextA == a && nextB == b) { // 못움직이는 경우 제외
            queue.append((nextA, nextB, count+1))
        }
    }
    
    idx += 1
}

print(answer)