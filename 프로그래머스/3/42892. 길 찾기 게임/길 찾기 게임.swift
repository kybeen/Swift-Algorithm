import Foundation

class Node {
    let num: Int
    let point: (x: Int, y: Int)
    var left: Node?
    var right: Node?
    
    init(_ num: Int, _ point: (x: Int, y: Int)) {
        self.num = num
        self.point = point
        self.left = nil
        self.right = nil
    }
    
    func addChild(_ child: Node) {
        if child.point.x < point.x {
            if left == nil {
                left = child
            } else {
                left?.addChild(child)
            }
        } else {
            if right == nil {
                right = child
            } else {
                right?.addChild(child)
            }
        }
    }
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    var nodes = [Node]()
    for i in 0..<nodeinfo.count {
        let info = nodeinfo[i]
        let point = (info[0], info[1])
        nodes.append(Node(i+1, point))
    }
    nodes.sort { $0.point.y > $1.point.y } // 레벨이 높은 순서로 정렬
    let root = nodes.first!
    
    for i in 1..<nodes.count {
        root.addChild(nodes[i])
    }
    
    var stk = [Int]()
    func traversal(_ node: Node, isPostOrder: Bool = false) {
        if !isPostOrder { stk.append(node.num) }
        
        if let left = node.left {
            traversal(left, isPostOrder: isPostOrder)
        }
        if let right = node.right {
            traversal(right, isPostOrder: isPostOrder)
        }
        
        if isPostOrder { stk.append(node.num) }
    }
    
    var result = [[Int]]()
    traversal(root)
    result.append(stk)
    stk = []
    traversal(root, isPostOrder: true)
    result.append(stk)
    
    return result
}