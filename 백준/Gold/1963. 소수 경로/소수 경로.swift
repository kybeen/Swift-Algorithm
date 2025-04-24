import Foundation

// 에라토스테네스의 채
var isPrime = Array(repeating: true, count: 10000)
isPrime[0] = false
isPrime[1] = false
for i in 2...Int(sqrt(10000)) {
    if isPrime[i] {
        var j = 2
        while i*j < 10000 {
            isPrime[i*j] = false
            j += 1
        }
    }
}

var answer: String = ""
let T = Int(readLine()!)!
for _ in 0..<T {
    let AB = readLine()!.split(separator: " ")
    let (A, B) = (Int(AB[0])!, Int(AB[1])!)
    let aArr = AB[0].map({ Int(String($0))! })
    let bArr = AB[1].map({ Int(String($0))! })
    
    var idx = 0
    var queue = [(nowArr: [Int], count: Int)]()
    var visited = Set<Int>()
    queue.append((aArr, 0))
    visited.insert(A)
    
    while idx < queue.count {
        let (nowArr, count) = queue[idx]
        
        if nowArr == bArr {
            answer += "\(count)\n"
            break
        }
        
        // 각 자릿수별로 숫자를 바꿔서 소수인 경우 BFS 진행
        for digit in 0..<4 {
            let minNum = (digit==0) ? 1 : 0 // 첫번째 자릿수는 0이 되면 안됨
            for num in minNum...9 {
                if nowArr[digit] != num {
                    var nextArr = nowArr
                    nextArr[digit] = num
                    let nextNum = Int(nextArr.map({ String($0) }).joined(separator: ""))!
                    if isPrime[nextNum] && !visited.contains(nextNum) {
                        visited.insert(nextNum)
                        queue.append((nextArr, count+1))
                    }
                }
            }
        }
        
        idx += 1
    }
    
    if !visited.contains(B) {
        answer += "Impossible\n"
    }
}
print(answer)