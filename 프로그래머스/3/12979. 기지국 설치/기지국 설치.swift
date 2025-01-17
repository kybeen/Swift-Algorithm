import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int {
    let stationCount = stations.count
    var now = 1
    var idx = 0
    var result = 0
    
    while now <= n {
        // 현재 위치가 이미 설치된 기지국의 전파가 도달하고 있는 곳이라면 해당 범위는 건너뜀
        if idx < stationCount && (now >= stations[idx] - w) {
            now = (stations[idx] + w + 1)
            idx += 1
        } else {
            // 기지국 설치
            now += (w*2+1)
            result += 1
        }
    }

    return result
}