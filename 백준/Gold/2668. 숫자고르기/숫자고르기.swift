let N = Int(readLine()!)!
var nums: [Int] = [0]

for _ in 0..<N {
    nums.append(Int(readLine()!)!)
}

var result = Set<Int>()

func dfs(_ now: Int, _ start: Int, _ visited: inout [Bool], _ setNums: inout [Int]) {
    if visited[now]{ // 이미 방문한 노드로 돌아왔다면 사이클 여부 확인
        if now == start { // 시작점이라면 사이클임
            result.formUnion(setNums)
        }
        return
    }
    
    visited[now] = true
    let next = nums[now]
    setNums.append(next)
    dfs(next, start, &visited, &setNums)
}

for i in 1...N {
    // 각 지점에서 시작해서 사이클이 생기는 경우 결과에 반영
    var visited = Array(repeating: false, count: N+1)
    var setNums = [Int]()
    dfs(i, i, &visited, &setNums)
}

print(result.count)
result.sorted().forEach { print($0) }