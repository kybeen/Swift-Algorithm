import Foundation

class Node {
    var prev: Node?
    var next: Node?
    var idx: Int
    
    init(prev: Node?, next: Node?, idx: Int) {
        self.prev = prev
        self.next = next
        self.idx = idx
    }
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var result = Array(repeating: "O", count: n)
    var nodes = [Node]()
    for i in 0..<n {
        let node = Node(prev: nil, next: nil, idx: i)
        nodes.append(node)
    }
    
    nodes[0].next = nodes[1]
    for i in 1..<n-1 {
        nodes[i].prev = nodes[i-1]
        nodes[i].next = nodes[i+1]
    }
    nodes[n-1].prev = nodes[n-2]
    
    // for node in nodes {
    //     print("Node\(node.idx) => prev: \(node.prev?.idx), next: \(node.next?.idx)")
    // }
    
    var deleted = [Node]()
    var now = nodes[k]
    
    for command in cmd {
        if command == "C" {
            result[now.idx] = "X"
            deleted.append(now)
            
            now.prev?.next = now.next
            now.next?.prev = now.prev
            if now.next == nil {
                now = now.prev!
            } else {
                now = now.next!
            }
            
        } else if command == "Z" {
            let popped = deleted.popLast()!
            result[popped.idx] = "O"
            popped.prev?.next = popped
            popped.next?.prev = popped
            
        } else {
            let commandPair = command.split(separator: " ")
            let direction = commandPair[0]
            let offset = Int(commandPair[1])!
            if direction == "U" {
                for _ in 0..<offset {
                    now = now.prev!
                }
            } else if direction == "D" {
                for _ in 0..<offset {
                    now = now.next!
                }
            }
        }
    }
    
    return result.joined(separator: "")
}