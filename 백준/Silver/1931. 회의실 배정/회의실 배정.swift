import Foundation

let N = Int(readLine()!)!
var meetings = [(start:Int, end:Int)]()
for _ in 0..<N {
    let meeting = readLine()!.split(separator: " ").map { Int($0)! }
    meetings.append((meeting[0], meeting[1]))
}
meetings.sort {
    if $0.end == $1.end {
        return $0.start < $1.start
    } else {
        return $0.end < $1.end
    }
}

var result = 0
var endedTime = 0
for meeting in meetings {
    if meeting.start >= endedTime {
        result += 1
        endedTime = meeting.end
    }
}
print(result)