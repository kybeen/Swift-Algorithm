import Foundation

let N = Int(readLine()!)!
var lights = Array(readLine()!).map { Int(String($0))! }
var target = Array(readLine()!).map { Int(String($0))! }

// Int 타입에 toggle 메서드 추가
extension Int {
    mutating func toggle() {
        if self == 0 {
            self = 1
        } else {
            self = 0
        }
    }
}

// i-1, i, i+1 토글시켜주는 메서드
func toggleLights(_ center: Int, _ lights: inout [Int] ) {
    if center == 0 { // 맨 앞의 전구
        lights[center].toggle()
        lights[center+1].toggle()
    } else if center == N-1 { // 맨 뒤의 전구
        lights[center-1].toggle()
        lights[center].toggle()
    } else {
        lights[center-1].toggle()
        lights[center].toggle()
        lights[center+1].toggle()
    }
}

var lightsA = lights // 맨 앞의 전구를 토글하지 않는 경우에 대한 배열
var resultA = 0

var lightsB = lights // 맨 앞의 전구를 토글하는 경우에 대한 배열
var resultB = 1
toggleLights(0, &lightsB)

for i in 1..<N {
    if lightsA[i-1] != target[i-1] {
        toggleLights(i, &lightsA)
        resultA += 1
    }
    if lightsB[i-1] != target[i-1] {
        toggleLights(i, &lightsB)
        resultB += 1
    }
}

if lightsA == target {
    print(resultA)
} else if lightsB == target {
    print(resultB)
} else {
    print(-1)
}