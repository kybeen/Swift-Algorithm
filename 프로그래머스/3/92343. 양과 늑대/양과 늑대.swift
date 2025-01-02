import Foundation

// BFS 노드 정보
struct Node {
    let num: Int // 노드 번호
    let sheep: Int
    let wolf: Int
    var nextNodes: Set<Int> // 현재 이동 상태를 기준으로 방문 가능한 다음 노드들
    
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
    
    // 트리 생성
    for edge in edges {
        let parent = edge[0]
        let child = edge[1]
        tree[parent].append(child)
    }
    
    var result = 1
    var idx = 0
    var queue = [Node]()
    let root = Node(0, sheep: 1, wolf: 0, nextNodes: Set<Int>(tree[0])) // 루트 노드
    queue.append(root)
    
    while idx < queue.count {
        let now = queue[idx]
        result = max(result, now.sheep)
        
        for next in now.nextNodes {
            // 큐에 새로 넣어줄 노드는 next를 방문한 상태이기 때문에 nextNodes에서 next를 제외해줘야 한다.
            var newNextNodes = now.nextNodes
            newNextNodes.remove(next)
            for child in tree[next] {
                newNextNodes.insert(child) // next의 자식 노드들을 nextNodes에 추가
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