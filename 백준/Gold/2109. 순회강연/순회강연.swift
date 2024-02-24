import Foundation

let n = Int(readLine()!)!
var lectures = [(d: Int, p: Int)]() // (d, p) == (기한, 강연료)
for _ in 0..<n {
    let pd = readLine()!.split(separator: " ").map { Int($0)! }
    lectures.append((pd[1], pd[0]))
}

var result = 0
var visited = [Bool](repeating: false, count: 10001) // schedule[i] : i일에 강연 스케줄이 잡혀있는지 여부
lectures.sort { $0.p > $1.p }

for lecture in lectures {
    // 아직 강연 스케줄이 잡히지 않았다면
    if !visited[lecture.d] {
        result += lecture.p // 스케줄 추가하고 강연료 더해줌
        visited[lecture.d] = true
    } else { // 강연 스케줄이 잡혀 있다면 d-1일부터 1일까지 역순으로 확인하며 가능한 날에 스케줄 잡아줌
        for i in stride(from: lecture.d, through: 1,by: -1) {
            if !visited[i] {
                result += lecture.p
                visited[i] = true
                break
            }
        }
    }
}

print(result)