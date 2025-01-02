import Foundation

class Node {
    let num: Int
    let x: Int
    let y: Int
    var left: Node?
    var right: Node?
    
    var description: String {
        "\(num)번 노드 => left: \(left?.num ?? -1) / right: \(right?.num ?? -1)"
    }
    
    init(_ num: Int, x: Int, y: Int) {
        self.num = num
        self.x = x
        self.y = y
        self.left = nil
        self.right = nil
    }
    
    func addChild(_ node: Node) {
        if node.x < self.x { // 왼쪽 자식
            if left != nil {
                left?.addChild(node)
            } else {
                left = node
            }
        } else { // 오른쪽 자식
            if right != nil {
                right?.addChild(node)
            } else {
                right = node
            }
        }
    }
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    var nodes = [Node]()
    for i in 0..<nodeinfo.count {
        let node = Node(i+1, x: nodeinfo[i][0], y: nodeinfo[i][1])
        nodes.append(node)
    }
    
    // y좌표가 높은 순으로 정렬 => first가 루트가 된다.
    let sortedNodes = nodes.sorted { $0.y > $1.y }
    
    // 이진 트리 구성
    let root = sortedNodes.first!
    for i in 1..<sortedNodes.count {
        let node = sortedNodes[i]
        root.addChild(node)
    }
    
    var result: [[Int]] = [[], []]
    // 전위 순회
    func preTraversal(_ now: Node) {
        result[0].append(now.num)
        if let left = now.left {
            preTraversal(left)
        }
        if let right = now.right {
            preTraversal(right)
        }
    }
    // 후위 순회
    func postTraversal(_ now: Node) {
        if let left = now.left {
            postTraversal(left)
        }
        if let right = now.right {
            postTraversal(right)
        }
        result[1].append(now.num)
    }
    
    preTraversal(root)
    postTraversal(root)
    
    return result
}