import Foundation

// 생성자 여부
var result = [Bool](repeating: true, count: 10001)
result[0] = false
for i in 1...10000 {
    let next = d(i)
    if next <= 10000 {
        result[next] = false
    }
}

// 다음 숫자 생성
func d(_ generator: Int) -> Int {
    let str = String(generator)
    var nextNum = generator
    for num in str {
        nextNum += Int(String(num))!
    }
    return nextNum
}

for i in 1...10000 {
    if result[i] {
        print(i)
    }
}