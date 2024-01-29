import Foundation

let N = Int(readLine()!)!
let symbols = Array(readLine()!)

var A = [Int]()
var S = [[Character]]()
let numbers = [Int](-10...10)

// 1차원 배열인 symbols를 잘라붙여서 2차원 배열인 S를 만들어준다.
var idx = 0
var rowLen = N
while rowLen >= 1 {
    let blank = [Character](repeating: " ", count: N-rowLen)
    let row = blank + symbols[idx..<idx+rowLen]
    S.append(row)
    idx += rowLen
    rowLen -= 1
}

var sum = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)

func dfs(_ depth: Int) {
    if depth == N {
        print(A.map{ String($0) }.joined(separator: " "))
        exit(0)
    }
    
    for number in numbers {
        A.append(number)
        if checkPossible(depth) {
            dfs(depth+1)
        }
        _ = A.popLast()
    }

}

func checkPossible(_ endIdx: Int) -> Bool {
    var sum = 0
    for i in stride(from: endIdx, through: 0, by: -1) {
        sum += A[i]
        
        if S[i][endIdx] == "+" && sum <= 0 { return false }
        if S[i][endIdx] == "-" && sum >= 0 { return false }
        if S[i][endIdx] == "0" && sum != 0 { return false }
    }
    return true
}

dfs(0)