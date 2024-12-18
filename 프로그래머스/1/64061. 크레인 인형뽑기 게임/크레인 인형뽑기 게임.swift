import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var columnStacks = Array(repeating: [Int](), count: board[0].count) // 각 열의 스택
    // board를 뒤집어서 인형뽑기 스택을 채워준다.
    for row in board.reversed() {
        for i in 0..<row.count {
            let doll = row[i]
            if doll != 0 {
                columnStacks[i].append(row[i])
            }
        }
    }
    
    var bucket = [Int]()
    var result = 0
    for move in moves {
        let idx = move - 1
        if !columnStacks[idx].isEmpty {
            let pickuppedDoll = columnStacks[idx].removeLast()
            if let last = bucket.last, last == pickuppedDoll {
                _ = bucket.removeLast()
                result += 2
            } else {
                bucket.append(pickuppedDoll)
            }
        }
    }
    
    return result
}