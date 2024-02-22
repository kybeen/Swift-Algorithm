import Foundation

struct Heap<T> {
    private var elements = [T]() // 실제로 데이터들을 저장하는 이진트리로 표현된 배열
    private let sortFunction: (T, T) -> Bool // 최소힙, 최대힙의 기준이 되는 정렬 로직
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    var peek: T? {
        return elements.first
    }
    var count: Int {
        return elements.count
    }
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sortFunction = sort
    }
    
    init(elements: [T], sort: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.sortFunction = sort
        buildHeap()
    }
    
    func leftChild(of index: Int) -> Int {
        return index*2 + 1
    }
    func rightChild(of index: Int) -> Int {
        return index*2 + 2
    }
    func parent(of index: Int) -> Int {
        return (index-1) / 2
    }
    
    // 삽입 연산
    mutating func insert(node: T) {
        elements.append(node)
        swimmUp(from: elements.count - 1)
    }
    mutating func swimmUp(from index: Int) {
        var nowIdx = index
        var parentIdx = parent(of: index)
        
        while nowIdx > 0 && sortFunction(elements[nowIdx], elements[parentIdx]) {
            elements.swapAt(nowIdx, parentIdx)
            nowIdx = parentIdx
            parentIdx = parent(of: nowIdx)
        }
    }
    
    // 삭제 연산
    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        
        if elements.count == 1 {
            return elements.removeLast()
        } else {
            let removeValue = elements[0]
            elements[0] = elements.removeLast()
            diveDown(from: 0)
            return removeValue
        }
    }
    mutating func diveDown(from index: Int) {
        var higherPriority = index
        let leftIndex = leftChild(of: index)
        let rightIndex = rightChild(of: index)
        
        // 왼쪽 자식 노드가 더 우선순위가 높을 때
        if leftIndex < elements.endIndex && sortFunction(elements[leftIndex], elements[higherPriority]) {
            higherPriority = leftIndex
        }
        // 오른쪽 자식 노드가 더 우선순위가 높을 때
        if rightIndex < elements.endIndex && sortFunction(elements[rightIndex], elements[higherPriority]) {
            higherPriority = rightIndex
        }
        // 교환이 필요한 경우는 교환 후 서브트리로 이동
        if higherPriority != index {
            elements.swapAt(higherPriority, index)
            diveDown(from: higherPriority)
        }
    }
    
    // 배열 전체를 힙으로 재구성
    mutating func buildHeap() {
        for i in stride(from: elements.count/2 - 1, through: 0, by: -1) {
            diveDown(from: i)
        }
    }
}

/*
 가벼운 가방부터
 담을 수 있는 보석들을 우선순위 큐에 넣고
 가장 비싼 보석을 꺼낸다.
 */
let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]
var jewels = [(m: Int, v: Int)]() // (무게, 가격)
for _ in 0..<N {
    let jewel = readLine()!.split(separator: " ").map { Int($0)! }
    jewels.append((jewel[0], jewel[1]))
}
var bags = [Int]() // 가방
for _ in 0..<K {
    bags.append(Int(readLine()!)!)
}

jewels.sort { $0.m < $1.m } // 가벼운 순서대로 보석 정렬
bags.sort(by: <) // 용량이 작은 가방 순서대로 정렬

var result = 0
var heap = Heap<(Int, Int)>(sort: { $0.1 > $1.1 }) // 가격이 비쌀수록 우선순위가 높은 최대 힙
var idx = 0
for bag in bags {
    // 현재 가방에 들어갈 수 있는 보석들을 힙에 추가
    while idx < N, jewels[idx].m <= bag {
        heap.insert(node: jewels[idx])
        idx += 1
    }
    // 힙에서 가장 비싼 보석을 빼준다.
    if !heap.isEmpty {
        result += heap.remove()!.1
    }
}

print(result)