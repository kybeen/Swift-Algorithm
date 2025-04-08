import Foundation

func solution(_ maps:[String]) -> [Int] {
    let maps = maps.map { row in
        row.map({ String($0) })
    }
    let rowCnt = maps.count
    let colCnt = maps[0].count
    let di = [0, 0, -1, 1]
    let dj = [-1, 1, 0, 0]
    
    var group = Array(repeating: Array(repeating: 0, count: colCnt), count: rowCnt)
    
    // 그룹 만들기
    func groupBFS(_ start: (i: Int, j: Int), _ groupNum: Int) {
        var idx = 0
        var queue = [(i: Int, j: Int)]()
        queue.append((start.i, start.j))
        group[start.i][start.j] = groupNum
        
        while idx < queue.count {
            let now = queue[idx]
            
            for k in 0..<4 {
                let nextI = now.i + di[k]
                let nextJ = now.j + dj[k]
                guard nextI >= 0 && nextJ >= 0 && nextI < rowCnt && nextJ < colCnt else { continue }
                if group[nextI][nextJ] == 0 && maps[nextI][nextJ] != "X" {
                    group[nextI][nextJ] = groupNum
                    queue.append((nextI, nextJ))
                }
            }
            
            idx += 1
        }
    }
    
    var nowGroup = 1
    for i in 0..<rowCnt {
        for j in 0..<colCnt {
            if group[i][j] == 0 && maps[i][j] != "X" {
                groupBFS((i, j), nowGroup)
                nowGroup += 1
            }
        }
    }
    
    // 각 섬에서 머무를 수 있는 날의 합 구하기
    var answer = [Int]()
    var visited = Array(repeating: Array(repeating: false, count: colCnt), count: rowCnt)
    func sumOfGroup(_ start: (i: Int, j: Int), _ groupNum: Int) -> Int {
        var sum = 0
        var idx = 0
        var queue = [(i: Int, j: Int)]()
        queue.append((start.i, start.j))
        visited[start.i][start.j] = true
        sum += Int(maps[start.i][start.j])!
        
        while idx < queue.count {
            let now = queue[idx]
            
            for k in 0..<4 {
                let nextI = now.i + di[k]
                let nextJ = now.j + dj[k]
                guard nextI >= 0 && nextJ >= 0 && nextI < rowCnt && nextJ < colCnt else { continue }
                if !visited[nextI][nextJ] && group[nextI][nextJ] == groupNum {
                    visited[nextI][nextJ] = true
                    sum += Int(maps[nextI][nextJ])!
                    queue.append((nextI, nextJ))
                }
            }
            
            idx += 1
        }
        
        return sum
    }
    for i in 0..<rowCnt {
        for j in 0..<colCnt {
            if group[i][j] != 0 && !visited[i][j] {
                answer.append(sumOfGroup((i, j), group[i][j]))
            }
        }
    }
    
    return answer.isEmpty ? [-1] : answer.sorted()
}