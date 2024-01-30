import Foundation

let N = Int(readLine()!)!
var tree = [String : [String]]()
for _ in 0..<N {
    let nodes = readLine()!.split(separator: " ").map { String($0) }
    tree[nodes[0]] = [nodes[1], nodes[2]]
}

var result: [String] = ["", "", ""]
func dfs(_ now: String) {
    let left = tree[now]![0]
    let right = tree[now]![1]
    
    result[0] += now // 전위순회
    if left != "." {
        dfs(left)
    }
    result[1] += now // 중위순회
    if right != "." {
        dfs(right)
    }
    result[2] += now // 후위순회
}

dfs("A")
print(result.joined(separator: "\n"))