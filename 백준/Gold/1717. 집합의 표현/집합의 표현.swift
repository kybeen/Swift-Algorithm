let nm = readLine()!.split(separator: " ").map({ Int($0)! })
let (n, m) = (nm[0], nm[1])
var parents = Array(0...n)
var rank = Array(repeating: 0, count: n+1)

func union(_ rootA: Int, _ rootB: Int) {
    if rank[rootA] > rank[rootB] {
        parents[rootB] = rootA
    } else if rank[rootB] > rank[rootA] {
        parents[rootA] = rootB
    } else {
        parents[rootB] = rootA
        rank[rootA] += 1
    }
}

func find(_ node: Int) -> Int {
    if parents[node] == node {
        return parents[node]
    } else {
        parents[node] = find(parents[node])
        return parents[node]
    }
}

var results = [String]()
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    let (command, a, b) = (input[0], input[1], input[2])
    if command == 1 { // find
        let result = find(a) == find(b) ? "YES" : "NO"
        results.append(result)
    } else { // union
        union(find(a), find(b))
    }
}
results.forEach { print($0) }