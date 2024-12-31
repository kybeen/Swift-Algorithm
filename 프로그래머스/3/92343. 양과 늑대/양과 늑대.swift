import Foundation

struct Node {
    let num: Int
    let sheep: Int
    let wolf: Int
    var nextNodes: Set<Int>
    
    var sheepCount: Int {
        return sheep - wolf
    }
    
    init(_ num: Int, sheep: Int, wolf: Int, nextNodes: Set<Int> = []) {
        self.num = num
        self.sheep = sheep
        self.wolf = wolf
        self.nextNodes = nextNodes
    }
}

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var tree = Array(repeating: [Int](), count: info.count)
    
    for edge in edges {
        let parent = edge[0]
        let child = edge[1]
        tree[parent].append(child)
    }
    
    var result = 1
    var idx = 0
    var queue = [Node]()
    let root = Node(0, sheep: 1, wolf: 0, nextNodes: Set<Int>(tree[0]))
    queue.append(root)
    
    while idx < queue.count {
        let now = queue[idx]
        result = max(result, now.sheep)
        
        for next in now.nextNodes {
            var newNextNodes = now.nextNodes
            newNextNodes.remove(next)
            for child in tree[next] {
                newNextNodes.insert(child)
            }
            
            if info[next] == 0 { // 양
                let nextNode = Node(next,
                                    sheep: now.sheep+1,
                                    wolf: now.wolf,
                                    nextNodes: newNextNodes)
                queue.append(nextNode)
            } else { // 늑대
                if now.sheepCount > 1 {
                    let nextNode = Node(next,
                                        sheep: now.sheep,
                                        wolf: now.wolf+1,
                                        nextNodes: newNextNodes)
                    queue.append(nextNode)
                }
            }
        }
        
        idx += 1
    }
    
    return result
}