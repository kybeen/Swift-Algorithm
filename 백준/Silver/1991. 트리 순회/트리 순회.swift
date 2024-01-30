import Foundation

let N = Int(readLine()!)!
var tree = [String : [String]]()
for _ in 0..<N {
    let nodes = readLine()!.split(separator: " ").map { String($0) }
    tree[nodes[0]] = [nodes[1], nodes[2]]
}

// 전위 순회
func dfs1(_ now: String) {
    print(now, terminator: "")
    
    for child in tree[now]! {
        if child != "." {
            dfs1(child)
        }
    }
}

// 중위 순회
func dfs2(_ now: String) {
    let left = tree[now]![0]
    let right = tree[now]![1]
    
    if left != "." {
        dfs2(left)
    }
    print(now, terminator: "")
    if right != "." {
        dfs2(right)
    }
}

// 후위 순회
func dfs3(_ now: String) {
    for child in tree[now]! {
        if child != "." {
            dfs3(child)
        }
    }
    
    print(now, terminator: "")
}

dfs1("A")
print()
dfs2("A")
print()
dfs3("A")