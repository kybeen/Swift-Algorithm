import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let totalGrid = brown + yellow // 전체 격자 개수
    var result = [Int]()
    
    // 가로-세로 중 한 쪽의 길이 (문제 조건 상 작은 쪽의 길이는 최소 3 이상이어야 함)
    var a = 3
    
    while true {
        // 가능한 가로-세로 조합의 경우를 확인
        guard totalGrid % a == 0 else {
            a += 1
            continue
        }
        let b = totalGrid / a
        // 갈색 격자의 수 조건(그림 참고) : (a + (b-2)) * 2
        if (a + b - 2) * 2 == brown {
            result = [a, b]
            break
        }
        
        a += 1
    }
    
    return result.sorted(by: >) // 내림차순 정렬해서 리턴
}