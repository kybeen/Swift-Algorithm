import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var nowProgresses = progresses
    var releases = [Int]()
    
    var idx = 0
    while idx < nowProgresses.count {
        // 오늘의 작업 수행
        for i in idx..<nowProgresses.count {
            if nowProgresses[i] < 100 {
                nowProgresses[i] += speeds[i]
            }
        }
        
        // 오늘 가능한 배포 개수 확인 후 반영
        if nowProgresses[idx] >= 100 {
            var todayRelease = 0
            while idx < nowProgresses.count && nowProgresses[idx] >= 100 {
                todayRelease += 1
                idx += 1
            }
            releases.append(todayRelease)
        }
    }
    
    return releases
}