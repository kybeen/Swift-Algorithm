import Foundation

let NC = readLine()!.split(separator: " ").map { Int($0)! }
let N = NC[0]
var C = NC[1]
var house = [Int]() // 집들의 좌표
for _ in 0..<N {
    house.append(Int(readLine()!)!)
}
house.sort(by: <)

// dist 이상 간격으로 C개 이상의 공유기를 설치할 수 있는지 확인하는 메서드
func checkWifiCnt(dist: Int) -> Bool {
    var wifiCnt = 1
    var prevWifi = house[0]
    for i in 1..<N {
        if house[i] - prevWifi >= dist {
            wifiCnt += 1
            prevWifi = house[i]
        }
        if wifiCnt >= C {
            return true
        }
    }
    return false
}

var start = 1 // 최소 거리
var end = house.last! - house.first! + 1 // 최대 거리

// C개 이상 설치할 수 있는 공유기 사이의 최대 거리를 구해준다.
while start + 1 < end {
    let mid = (start + end) / 2
    
    if checkWifiCnt(dist: mid) {
        start = mid
    } else {
        end = mid
    }
}

print(start)