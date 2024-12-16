import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    let rowCount = arr1.count
    let colCount = arr2[0].count
    let borderCount = arr2.count
    var result = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    
    func sum(_ row: Int, _ col: Int) -> Int {
        var total: Int = 0
        for offset in 0..<borderCount {
            let multipleValue = arr1[row][offset] * arr2[offset][col]
            total += multipleValue
        }
        return total
    }
    
    for row in 0..<rowCount {
        for col in 0..<colCount {
            result[row][col] = sum(row, col)
        }
    }
    
    return result
}