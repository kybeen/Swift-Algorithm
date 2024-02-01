import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let a = [1, 2, 3, 4, 5]
    let b = [2, 1, 2, 3, 2, 4, 2, 5]
    let c = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    let aCnt = a.count
    let bCnt = b.count
    let cCnt = c.count
    
    var score = [0, 0, 0]
    var result = [Int]()
    
    for i in 0..<answers.count {
        if answers[i] == a[i % aCnt] { score[0] += 1 }
        if answers[i] == b[i % bCnt] { score[1] += 1 }
        if answers[i] == c[i % cCnt] { score[2] += 1 }
    }
    
    let highScore = score.max()!
    for i in 0..<3 {
        if score[i] == highScore {
            result.append(i+1)
        }
    }
    
    return result
}