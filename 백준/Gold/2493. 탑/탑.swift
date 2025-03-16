let N = Int(readLine()!)!
var towers = readLine()!.split(separator: " ").map({ Int($0)! })
var result = Array<Int>(repeating: 0, count: N)

if N > 1 {
    var l = N - 1
    var r = N - 1
    var nonDetermined = [Int]() // 아직 결정되지 않은 탑의 인덱스
    
    while l >= 0 {
        if l == r {
            l -= 1
        } else {
            let left = towers[l]
            nonDetermined.append(r)
            
            // 현재 left가 수신 가능한 오른쪽의 탑들 반영
            while let last = nonDetermined.last, left >= towers[last] {
                result[last] = (l+1)
                _ = nonDetermined.popLast()
            }
            
            r -= 1
        }
    }
}

print(result.map({ String($0) }).joined(separator: " "))