import Foundation

let N = Int(readLine()!)!
let S = readLine()!.split(separator: " ").map { Int($0)! }

// 만들 수 있는 자연수들의 집합
var possibleNums = Set<Int>()

func dfs(_ now: Int, _ sum: Int) {
    // 현재의 sum을 possibleNums 집합에 추가
    possibleNums.insert(sum)
    
    for i in now+1..<N {
        dfs(i, sum+S[i])
    }
}

dfs(-1, 0)

// 만들 수 있는 자연수들의 배열 (오름차순으로 정렬)
let resultArr = Array(possibleNums).sorted()

// 나올 수 없는 가장 작은 자연수 찾기
// 1부터 1씩 증가해가며 일치하지 않는 수가 나온다면 반복문 종료 (반복문이 끝날 때까지 나타나지 않으면 가능한 모든 자연수가 연속해있는 것이기 때문에 마지막 수보다 1 큰 자연수가 정답)
var impossible = 1
for num in resultArr {
    if num > 0 {
        if num != impossible {
            break
        } else {
            impossible += 1
        }
    }
}
print(impossible)