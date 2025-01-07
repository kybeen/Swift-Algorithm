import Foundation

func solution(_ n:Int) -> Int {
    var columns = [Int]()
    var result: Int = 0
    
    func isValid(_ nextRow: Int, _ nextCol: Int) -> Bool {
        var result: Bool = true
        for row in 0..<columns.count {
            if (nextRow == row) || (nextCol == columns[row]) { result = false }
            if abs(nextRow - row) == abs(nextCol - columns[row]) { result = false }
        }
        return result
    }
    
    func dfs(_ nowRow: Int) {
        if columns.count == n {
            result += 1
            return
        }
        
        let nextRow = nowRow + 1
        for nextCol in 0..<n {
            if !columns.contains(nextCol) {
                if isValid(nextRow, nextCol) {
                    columns.append(nextCol)
                    dfs(nextRow)
                    _ = columns.popLast()
                }
            }
        }
    }
    
    dfs(-1)
    
    return result
}