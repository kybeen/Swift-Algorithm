// import Foundation

// func solution(_ arr:[[Int]]) -> [Int] {
//     let n = arr.count
//     var arr = arr
//     var compressTable = Array(repeating: Array(repeating: 0, count: n), count: n)
    
//     var maxDepth = 0
//     func compress(_ start: (i: Int, j: Int), _ len: Int) {
//         var compressValue = arr[start.i][start.j]
//         var depth = compressTable[start.i][start.j]
        
//         for i in start.i..<start.i+len {
//             for j in start.j..<start.j+len {
//                 if (arr[i][j] != compressValue) || (compressTable[i][j] != depth) {
//                     return
//                 }
//             }
//         }
//         for i in start.i..<start.i+len {
//             for j in start.j..<start.j+len {
//                 arr[i][j] = compressValue
//                 compressTable[i][j] = (depth+1)
//                 maxDepth = max(maxDepth, depth+1)
//             }
//         }
//     }
    
//     var size = n
//     while size >= 2 {
//         size /= 2
//         for i in stride(from: 0, to: n, by: size) {
//             for j in stride(from: 0, to: n, by: size) {
//                 compress((i,j), size)
//             }
//         }
//     }
    
//     for a in arr {
//         print(a)
//     }
//     print("---------------")
//     for c in compressTable {
//         print(c)
//     }
    
//     var result = [0, 0]
//     func count(_ start: (i: Int, j: Int), _ len: Int) -> Int? {
//         let compressValue = arr[start.i][start.j]
//         var depth = compressTable[start.i][start.j]
//         print(start,len,depth,maxDepth)
//         guard depth <= maxDepth else { return nil }
//         maxDepth = min(maxDepth, depth)
        
//         for i in start.i..<start.i+len {
//             for j in start.j..<start.j+len {
//                 if (arr[i][j] != compressValue) || (compressTable[i][j] != depth) {
//                     return nil
//                 }
//             }
//         }
//         return compressValue
//     }
    
//     size = n
//     while size >= 2 {
//         size /= 2
//         for i in stride(from: 0, to: n, by: size) {
//             for j in stride(from: 0, to: n, by: size) {
//                 if let countedValue = count((i,j), size) {
//                     if countedValue == 0 {
//                         result[0] += 1
//                     } else {
//                         result[1] += 1
//                     }
//                 }
//             }
//         }
//     }
    
//     return result
// }



import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    let N = arr.count
    
    func compress(_ i: Int, _ j: Int, _ len: Int) -> (Int, Int) {
        if len == 1 {
            let num = arr[i][j]
            return (num == 0) ? (1, 0) : (0, 1)
        } else {
            let nextLen = len / 2
            var sums = [(Int, Int)]()
            sums.append(compress(i, j, nextLen))
            sums.append(compress(i, j+nextLen, nextLen))
            sums.append(compress(i+nextLen, j, nextLen))
            sums.append(compress(i+nextLen, j+nextLen, nextLen))
            let zeroSum = sums.map { $0.0 }.reduce(0, +)
            let oneSum = sums.map { $0.1 }.reduce(0, +)
            
            if zeroSum != 0 && oneSum != 0 {
                return (zeroSum, oneSum)
            } else if zeroSum == 0 {
                return (0, 1)
            } else {
                return (1, 0)
            }
        }
    }
    
    let result = compress(0, 0, N)
    return [result.0, result.1]
}












