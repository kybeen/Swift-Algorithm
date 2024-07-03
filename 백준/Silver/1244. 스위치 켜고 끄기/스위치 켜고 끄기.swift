import Foundation

let switchNum = Int(readLine()!)! // 스위치 개수
var switches = readLine()!.split(separator: " ").map { Int($0)! } // 스위치 상태
switches = [0] + switches // 스위치 번호와 인덱스 맞추기
let studentNum = Int(readLine()!)! // 학생 수
var students = [(gender: Int, num: Int)]()
for _ in 0..<studentNum {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    students.append((input[0], input[1])) // 성별(남1,여2), 받은 수
}

// 스위치 토글 함수
func toggle(_ idx: Int) {
    if switches[idx] == 0 {
        switches[idx] = 1
    } else {
        switches[idx] = 0
    }
}

for student in students {
    let num = student.num
    
    if student.gender == 1 { // 남자인 경우
        for i in stride(from: num, through: switchNum, by: num) {
            toggle(i)
        }
    } else if student.gender == 2 { // 여자인 경우
        toggle(num)
        for i in 1...switchNum {
            let left = num-i
            let right = num+i
            if (left >= 1) && (right <= switchNum) {
                // 대칭이라면 해당 좌표들을 토글
                if switches[left] == switches[right] {
                    toggle(left)
                    toggle(right)
                } else {
                    // 대칭이 아니라면 종료
                    break
                }
            }
        }
    }
}

// 결과 출력
switches.removeFirst()
// 스위치 개수가 20개 이하인 경우
if switches.count <= 20 {
    print(switches.map { String($0) }.joined(separator: " "))
} else { // 스위치 개수가 20개를 넘는 경우 20개씩 끊어서 출력
    var startIdx = 0
    var endIdx = startIdx + 19
    while startIdx < switches.count {
        if endIdx > switches.count {
            endIdx = switches.count-1
        }
        let row = switches[startIdx...endIdx]
        print(row.map { String($0) }.joined(separator: " "))
        startIdx = endIdx + 1
        endIdx = startIdx + 19
    }
}