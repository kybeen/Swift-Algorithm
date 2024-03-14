import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var done = 0 // 실행된 프로세스 개수
    var queue = priorities
    var targetIdx = location // 알고 싶은 프로세스의 현재 인덱스
    
    while true {
        let now = queue.removeFirst()
        if !queue.isEmpty && queue.max()! > now { // 우선순위가 더 높은 프로세스가 큐에 있다면 다시 넣어준다.
            queue.append(now)
            if targetIdx == 0 { // 다시 넣어준 프로세스가 타겟 프로세스였다면 인덱스 끝값으로 갱신
                targetIdx = queue.count - 1
            } else { // 그렇지 않다면 인덱스 1 감소
                targetIdx -= 1
            }
        } else { // 우선순위가 더 높은 프로세스가 없다면 실행
            done += 1
            // 실행된 프로세스가 타겟 프로세스였다면 종료
            if targetIdx == 0 {
                break
            } else { // 그렇지 않다면 인덱스 1 감소
                targetIdx -= 1
            }
        }
    }
    
    return done
}