import Foundation

// 한 유저가 같은 유저를 여러번 신고한 횟수 는 1회로 처리
// k번 이상 신고되면 정지 -> 신고한 유저들에게 메일 발송

struct ReportInfo {
    var reportedCount: Int // 신고 당한 횟수
    var reportedUsers: Set<String> // 신고한 유저 목록
    
    init() {
        reportedCount = 0
        reportedUsers = Set<String>()
    }
}

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportDict = [String: ReportInfo]()
    for id in id_list {
        reportDict[id] = ReportInfo()
    }
    
    for rep in report {
        let users = rep.split(separator: " ").map { String($0) }
        let reportUser = users[0]
        let reportedUser = users[1]
        // 해당 유저가 처음 신고하는 유저라면 딕셔너리 추가, 신고 횟수 카운트
        if !reportDict[reportUser]!.reportedUsers.contains(reportedUser) {
            reportDict[reportUser]!.reportedUsers.insert(reportedUser)
            reportDict[reportedUser]!.reportedCount += 1
        }
    }
    
    var result = Array(repeating: 0, count: id_list.count)
    for i in 0..<id_list.count {
        let user = id_list[i]
        for reportedUser in reportDict[user]!.reportedUsers {
            if reportDict[reportedUser]!.reportedCount >= k {
                result[i] += 1
            }
        }
    }
    
    return result
}