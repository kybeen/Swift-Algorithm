import Foundation

struct FailureInfo {
    let stageNumber: Int
    let failureRate: Double
}

// N : 전체 스테이지 개수
// stages: 사용자가 현재 멈춰있는 스테이지 번호들
func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var bottledCount: [Int] = Array(repeating: 0, count: N+1) // 클리어하지 못한 플레이어 수
    var reachedCount: [Int] = Array(repeating: 0, count: N+1) // 도달한 플레이어 수
    var failureRatePerStage = [FailureInfo]()
    
    for stage in stages {
        // 도달 체크
        for i in 1..<stage {
            reachedCount[i] += 1
        }
        // 끝까지 가지 못한 경우 클리어 하지 못한 스테이지 체크
        if stage <= N {
            reachedCount[stage] += 1
            bottledCount[stage] += 1
        }
    }
    
    for i in 1...N {
        let failureInfo = FailureInfo(
            stageNumber: i,
            failureRate: Double(bottledCount[i]) / Double(reachedCount[i])
        )
        failureRatePerStage.append(failureInfo)
    }
    
    let result = failureRatePerStage.sorted {
        $0.failureRate > $1.failureRate
    }.map {
        $0.stageNumber
    }
    
    return result
}