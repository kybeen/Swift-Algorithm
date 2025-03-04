import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let totalQueue = queue1 + queue2 // 두 큐를 합친 배열
    let totalLength = totalQueue.count
    let totalSum = totalQueue.reduce(0, +)
    let target = totalSum / 2
    
    // 두 큐의 합을 똑같이 나눌 수 없는 조건
    if totalSum % 2 != 0 { return -1 } // 총합이 홀수인 경우
    if totalQueue.max()! > target { return -1 } // 원소 중 target보다 큰 값이 있는 경우
    
    // queue1의 합과 좌우 포인터
    var sumA = queue1.reduce(0, +)
    var (aLeft, aRight) = (0, queue1.count-1)
    
    var count = 0
    while aRight < totalLength-1 && aLeft <= aRight {
        if sumA < target { // queue1에 원소 insert
            aRight += 1
            sumA += totalQueue[aRight]
        } else if sumA > target { // queue1의 원소 pop
            sumA -= totalQueue[aLeft]
            aLeft += 1
        } else {
            break
        }
        count += 1
    }
    
    return sumA == target ? count : -1
}