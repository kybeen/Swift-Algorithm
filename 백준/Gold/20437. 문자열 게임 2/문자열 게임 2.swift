let T = Int(readLine()!)!
var result = [[Int]]()

for _ in 0..<T {
    let W = readLine()!.map({ String($0) })
    let K = Int(readLine()!)!
    var dict = [String: [Int]]() // 문자: [인덱스]
    for (idx, alphabet) in W.enumerated() {
        dict[alphabet, default: []].append(idx)
    }
    // K번 이상 등장하는 문자들만 필터링
    dict = dict.filter({ $0.value.count >= K })
    
    // 어떤 문자를 정확히 K개를 포함하는 가장 짧은 연속 문자열의 길이
    var answer1 = Int.max
    // 어떤 문자를 정확히 K개를 포함하고, 문자열의 첫 번째와 마지막 글자가 해당 문자로 같은 가장 긴 연속 문자열의 길이
    var answer2 = 0
    for (_, indicies) in dict {
        var l = 0
        var r = K - 1
        while r < indicies.count {
            let left = indicies[l]
            let right = indicies[r]
            let length = right - left + 1
            answer1 = min(answer1, length)
            answer2 = max(answer2, length)
            l += 1
            r += 1
        }
    }
    
    if answer1 == Int.max && answer2 == 0 {
        result.append([-1])
    } else {
        result.append([answer1, answer2])
    }
}

result.forEach { print($0.map({ String($0) }).joined(separator: " ")) }