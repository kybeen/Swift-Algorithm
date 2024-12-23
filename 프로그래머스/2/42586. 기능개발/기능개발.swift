// import Foundation

// func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
//     var nowProgresses = progresses
//     var releases = [Int]()
    
//     var idx = 0
//     while idx < nowProgresses.count {
//         // 오늘의 작업 수행
//         for i in idx..<nowProgresses.count {
//             if nowProgresses[i] < 100 {
//                 nowProgresses[i] += speeds[i]
//             }
//         }
        
//         // 오늘 가능한 배포 개수 확인 후 반영
//         if nowProgresses[idx] >= 100 {
//             var todayRelease = 0
//             while idx < nowProgresses.count && nowProgresses[idx] >= 100 {
//                 todayRelease += 1
//                 idx += 1
//             }
//             releases.append(todayRelease)
//         }
//     }
    
//     return releases
// }


import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var taskStack = Array(progresses.reversed())
    var reversedSpeeds = Array(speeds.reversed())
    
    var result = [Int]()
    while !taskStack.isEmpty {
        var releaseCount = 0
        for i in 0..<taskStack.count {
            taskStack[i] += reversedSpeeds[i]
        }
        while let last = taskStack.last, last >= 100 {
            _ = taskStack.popLast()
            _ = reversedSpeeds.popLast()
            releaseCount += 1
        }
        result.append(releaseCount)
    }
    
    return result.filter { $0 != 0 }
}










