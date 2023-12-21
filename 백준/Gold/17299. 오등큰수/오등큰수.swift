import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var presentCnt = [Int: Int](arr.map { ($0, 1) }, uniquingKeysWith: +) // 각 수의 등장 횟수를 기록하는 딕셔너리
var result = [Int](repeating: -1, count: n) // 결과 저장할 배열
var stk = [Int]()

for i in 0..<n {
    let nowNum = arr[i]
    while !stk.isEmpty && presentCnt[arr[stk.last!]]! < presentCnt[nowNum]! {
        result[stk.popLast()!] = nowNum
    }
    stk.append(i)
}
print(result.map { String($0) }.joined(separator: " "))