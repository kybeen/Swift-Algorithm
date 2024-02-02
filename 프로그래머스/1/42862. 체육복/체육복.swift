import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var students = [Bool](repeating: true, count: n+1) // 학생들의 체육복 보유 여부
    var reserves = [Bool](repeating: false, count: n+1) // 여벌 체육복 보유 여부
    
    // 체육복 없는 학생 표시
    students[0] = false
    for l in lost {
        students[l] = false
    }
    
    // 여벌 체육복 있는 학생 표시
    for r in reserve {
        // 만약 도난당한 학생이라면 자기가 입어야 함
        if !students[r] {
            students[r] = true
        } else {
            reserves[r] = true
        }
    }
    
    for i in 1...n {
        if students[i] == false {
            // 앞번호 학생이 여벌을 갖고 있으면 빌려준다.
            if reserves[i-1] {
                reserves[i-1] = false
                students[i] = true
                continue
            }
            // 앞번호 학생은 여벌이 없지만 뒷번호 학생이 여벌을 갖고 있으면 빌려준다.
            if i < n && reserves[i+1] {
                reserves[i+1] = false
                students[i] = true
            }
        }
    }
    
    var result = students.filter { $0 }
    return result.count
}