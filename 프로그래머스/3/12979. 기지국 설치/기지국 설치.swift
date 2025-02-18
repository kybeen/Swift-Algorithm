import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int {
    let stationCount = stations.count
    var stationIdx = 0
    var now = 1
    var answer = 0
    
    // 새로운 기지국 설치하고 이동
    func addNewTower() {
        now += (2*w + 1)
        answer += 1
    }
    
    // now 위치에 이미 기지국이 설치된 곳의 전파가 도달하는지 확인
    // 그렇지 않다면 새 기지국 설치
    while now <= n {
        guard stationIdx < stationCount else {
            addNewTower()
            continue
        }
        
        let leftBorder = stations[stationIdx] - w
        if now >= leftBorder {
            now = stations[stationIdx] + w + 1
            stationIdx += 1
        } else {
            addNewTower()
        }
    }

    return answer
}