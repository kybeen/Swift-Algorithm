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
    // A의 길이(depth와 같음)가 N에 도달하면 모든 부호에 문제가 없던 것이므로 결과 출력
    if depth == N {
        print(A.map{ String($0) }.joined(separator: " "))
        exit(0) // 프로그램 종료
    }
    
    for number in numbers {
        A.append(number)
        // 부호 검사가 통과할 때만 DFS 진행
        if checkPossible(depth) {
            dfs(depth+1)
        }
        _ = A.popLast()
    }

}

/*
 S[i][j] 배열과 부호가 매치되는지 확인하는 함수
 - 일일이 다 더해주는게 아니라 마지막으로 더해주는 인덱스부터 더해가면 이전의 합을 활용함으로써 시간을 단축시킬 수 있다.
 - ex) j == 2일 때
    - S[2][2] : A[2]
    - S[1][2] : A[2] + A[1]
    - S[0][2] : A[2] + A[1] + A[0]
 */
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