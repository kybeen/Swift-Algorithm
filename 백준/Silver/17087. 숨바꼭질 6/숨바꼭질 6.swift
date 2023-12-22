import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a%b)
    }
}

let ns = readLine()!.split(separator: " ").map { Int($0)! }
let n = ns[0] // 동생 N명
let s = ns[1] // 수빈이의 현재 위치 S
let targets = readLine()!.split(separator: " ").map { Int($0)! } // 동생들 위치

// 수빈이와 동생들의 거리
var distances = targets.map { ($0-s) > 0 ? ($0-s) : -($0-s) }
if distances.count == 1 {
    print(distances.first!)
} else {
    var result = gcd(distances[0], distances[1])
    var i = 2
    while i < distances.count-1 {
        result = gcd(result, distances[i])
        i += 1
    }
    print(result)
}