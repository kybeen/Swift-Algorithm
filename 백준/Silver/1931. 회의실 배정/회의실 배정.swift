import Foundation

struct Meeting {
    let start: Int
    let end: Int
}

let N = Int(readLine()!)!
var meetings: [Meeting] = []
for _ in 0..<N {
    let timeInput = readLine()!.split(separator: " ").map({ Int($0)! })
    meetings.append(Meeting(start: timeInput[0], end: timeInput[1]))
}

let sortedMeetings = meetings.sorted {
    if $0.end == $1.end {
        return $0.start < $1.start
    } else {
        return $0.end < $1.end
    }
}
var bestSchedule: [Meeting] = [sortedMeetings.first!]
for i in 1..<N {
    let prev = bestSchedule.last!
    if sortedMeetings[i].start >= prev.end {
        bestSchedule.append(sortedMeetings[i])
    }
}
print(bestSchedule.count)