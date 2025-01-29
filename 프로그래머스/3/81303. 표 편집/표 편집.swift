import Foundation

class Node {
    let idx: Int
    var prev: Node?
    var next: Node?
    
    init(_ idx: Int, _ prev: Node? = nil, _ next: Node? = nil) {
        self.idx = idx
        self.prev = prev
        self.next = next
    }
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var result: [String] = Array(repeating: "O", count: n)
    var table = [Node]()
    for i in 0..<n {
        let node = Node(i, table.last)
        table.last?.next = node
        table.append(node)
    }
    
    // for t in table {
    //     print("\(t.idx)번 => prev:\(t.prev?.idx ?? -1) / next:\(t.next?.idx ?? -1)")
    // }
    
    var now = table[k]
    var deleted = [Node]()
    
    for command in cmd {
        let command = command.components(separatedBy: " ")
        if command[0] == "U" {
            var count = Int(command[1])!
            while count > 0 {
                if let prev = now.prev {
                    now = prev
                }
                count -= 1
            }
        } else if command[0] == "D" {
            var count = Int(command[1])!
            while count > 0 {
                if let next = now.next {
                    now = next
                }
                count -= 1
            }
        } else if command[0] == "C" {
            result[now.idx] = "X"
            now.prev?.next = now.next
            now.next?.prev = now.prev
            deleted.append(now)
            if let next = now.next {
                now = next
            } else if let prev = now.prev {
                now = prev
            }
        } else if command[0] == "Z" {
            let restored = deleted.popLast()!
            restored.prev?.next = restored
            restored.next?.prev = restored
            result[restored.idx] = "O"
        }
    }
    
    return result.joined()
}