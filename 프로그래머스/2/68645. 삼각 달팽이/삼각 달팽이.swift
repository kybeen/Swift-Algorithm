import Foundation

enum Direction {
    case down
    case right
    case diagonal
}

func solution(_ n:Int) -> [Int] {
    var total = (1...n).reduce(0, +)
    var triangle = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    var nowNum = 1
    var nowDir = Direction.down
    var (i, j) = (0, 0)
    triangle[i][j] = nowNum
    
    while nowNum < total {
        switch nowDir {
        case .down:
            if i < n-1, triangle[i+1][j] == 0 {
                i += 1
                nowNum += 1
                triangle[i][j] = nowNum
            } else {
                nowDir = .right
            }
        case .right:
            if j < n-1, triangle[i][j+1] == 0 {
                j += 1
                nowNum += 1
                triangle[i][j] = nowNum
            } else {
                nowDir = .diagonal
            }
        case .diagonal:
            if triangle[i-1][j-1] == 0 {
                i -= 1
                j -= 1
                nowNum += 1
                triangle[i][j] = nowNum
            } else {
                nowDir = .down
            }
        }
    }
    
    var result = [Int]()
    for i in 0..<n {
        for j in 0..<n {
            if triangle[i][j] != 0 {
                result.append(triangle[i][j])
            }
        }
    }
    
    return result
}