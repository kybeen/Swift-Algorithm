import Foundation

let sticks = Array(readLine()!)
var nowStickNum = 0 // 현재 쇠막대기 개수
var result = 0 // 잘려진 조각 개수

for i in 0..<sticks.count {
    switch sticks[i] {
    case "(":
        nowStickNum += 1
        result += 1
    case ")":
        nowStickNum -= 1
        if sticks[i-1] == "(" { // 레이저인 경우
            result -= 1
            result += nowStickNum
        }
    default:
        break
    }
}
print(result)