import Foundation

let k = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { String($0) }

var arr = [Int]()
var result = [String]() // 부등호 관계를 만족시키는 정수들을 저장할 배열 (맨 앞자리가 0일수도 있기 때문에 문자열로 저장)

func dfs(_ idx: Int) {
    // 결과 수열의 마지막 인덱스가 부등호 개수와 같으면 (결과 수열의 길이가 부등호 개수보다 1개 많아지면) 결과 배열에 저장
    if idx == k {
        result.append(arr.reduce(""){ $0 + String($1) })
        return
    }
    
    for i in 0...9 {
        // 0~9 중 확인 안 된 수가 부등호 조건에 부합하면 DFS 진행
        if !arr.contains(i) {
            switch A[idx] {
            case "<":
                if arr.last! < i {
                    arr.append(i)
                    dfs(idx+1)
                    _ = arr.popLast()
                }
            case ">":
                if arr.last! > i {
                    arr.append(i)
                    dfs(idx+1)
                    _ = arr.popLast()
                }
            default:
                continue
            }
        }
    }
}

for i in 0...9 {
    arr.append(i)
    dfs(0)
    _ = arr.popLast()
}

// 결과 정렬 후 첫번째와 마지막 값 출력
result.sort()
print(result.last!)
print(result.first!)