import Foundation

// 최소 힙
struct MinHeap<T: Comparable> { // 비교 가능한 데이터를 넣기 위해 Comparable 프로토콜 채택
    var heap: Array<T> = []
    
    init() {}
    init(_ data: T) {
        heap.append(data) // 0번 인덱스 채우기용
        heap.append(data) // 실제 루트노드 채우기
    }
    
    /*
     [insert - 데이터 삽입]
     1. 완전 이진 트리 구조에 맞춰 삽입
     2. 삽입된 데이터가 부모노드보다 커질 때까지 swap (최소 힙 구조가 되도록)
     */
    mutating func insert(_ data: T) {
        if heap.count == 0 {
            heap.append(data)
            heap.append(data)
            return
        }
        
        heap.append(data)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 { // 루트 노드일 때
                return false
            }
            let parentIndex: Int = insertIndex / 2
            return heap[insertIndex] < heap[parentIndex] ? true : false // 부모 노드 값이 더 크다면 바꿔야함
        }
        
        var insertIndex: Int = heap.count - 1
        while isMoveUp(insertIndex) {
            let parentIndex: Int = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    /*
     [pop - 데이터 꺼내기(삭제하기)]
     1. 가장 작은 값인 루트 노드를 삭제
     2. 가장 마지막에 추가된 노드(배열의 마지막 요소)를 루트 노드로 이동
     3. 이동된 루트 노드의 데이터가 왼쪽,오른쪽 자식 노드의 데이터보다 작을 때까지 자식 노드 중 작은 값을 가진 노드와 swap
     */
    enum moveDownStatus { case none, left, right }
    
    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }
        
        let returnData = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex = (poppedIndex * 2)
            let rightChildIndex = (poppedIndex * 2) + 1
            
            // case 1. 자식 노드가 없는 경우 (완전이진트리는 왼쪽부터 채워지기 때문에 왼쪽 자식만 확인하면 됨)
            if leftChildIndex >= heap.count {
                return .none // 내려갈 필요 x
            }
            
            // case 2. 왼쪽 자식 노드만 있는 경우
            if rightChildIndex >= heap.count {
                return heap[leftChildIndex] < heap[poppedIndex] ? .left : .none
            }
            
            // case 3. 왼쪽&오른쪽 자식 노드 모두 있는 경우
            // case 3-1. 자식들이 자신보다 모두 큰 경우
            if (heap[leftChildIndex] > heap[poppedIndex]) && (heap[rightChildIndex] > heap[poppedIndex]) {
                return .none // 내려갈 필요 x
            }
            // case 3-2. 자식들이 자신보다 모두 작은 경우 (왼쪽&오른쪽 중 더 작은 자식 선택)
            if (heap[leftChildIndex] < heap[poppedIndex]) && (heap[rightChildIndex] < heap[poppedIndex]) {
                return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right // 더 작은쪽 자식 노드랑 swap
            }
            // case 3-3. 왼쪽&오른쪽 중 한 자식만 자신보다 작은 경우
            return heap[leftChildIndex] < heap[poppedIndex] ? .left : .right // 자신보다 작은 자식노드랑 swap
        }
        
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(poppedIndex, leftChildIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = (poppedIndex * 2) + 1
                heap.swapAt(poppedIndex, rightChildIndex)
                poppedIndex = rightChildIndex
            }
        }
    }
    
    func isEmpty() -> Bool {
        return heap.count <= 1 ? true : false
    }
}

// 우선순위 큐에 넣을 데이터
struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.cost < rhs.cost
    }
    let node: Int
    let cost: Int
}

let VE = readLine()!.split(separator: " ").map { Int($0)! }
let V = VE[0] // 정점의 개수
let E = VE[1] // 간선의 개수
let start = Int(readLine()!)! // 시작 정점
var nodes = [[Node]](repeating: [], count: V+1)
for _ in 0..<E {
    let uvw = readLine()!.split(separator: " ").map { Int($0)! }
    let u = uvw[0]
    let v = uvw[1]
    let w = uvw[2]
    nodes[u].append(Node(node: v, cost: w))
}

var distance = [Int](repeating: Int.max, count: V+1)

// 다익스트라 알고리즘
func dijkstra(start: Int) {
    // cost에 대한 최소 힙 초기화
    var minHeap = MinHeap<Node>()
    distance[start] = 0
    minHeap.insert(Node(node: start, cost: 0))
    
    while !minHeap.isEmpty() {
        let now = minHeap.pop()!
        
        // 이미 최소값으로 갱신된 노드라면 넘어감
        if distance[now.node] < now.cost {
            continue
        }
        
        // 현재 노드와 연결된 노드 확인
        for to in nodes[now.node] {
            let toCost = now.cost + to.cost
            // 더 적은 비용이 든다면 갱신
            if toCost < distance[to.node] {
                distance[to.node] = toCost
                minHeap.insert(Node(node: to.node, cost: toCost))
            }
        }
    }
}

dijkstra(start: start)
for i in 1...V {
    if distance[i] == Int.max {
        print("INF")
    } else {
        print(distance[i])
    }
}