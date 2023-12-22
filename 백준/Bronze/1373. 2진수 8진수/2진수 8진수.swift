import Foundation

// 3자리로 자른 2진수의 부분을 8진수로 변환하는 메서드
func octFragment(_ a: Int, _ b: Int, _ c: Int) -> String {
    var octFrag: Int = 0
    
    if a == 1 {
        octFrag += 4
    }
    if b == 1 {
        octFrag += 2
    }
    if c == 1 {
        octFrag += 1
    }
    
    return String(octFrag)
}

var binary = Array(readLine()!)
var result: String = ""

var head = binary.count % 3 // 앞부분 개수
// 앞의 비는 부분은 0으로 채워준다.
if head == 2 {
    binary.insert(Character("0"), at: 0)
} else if head == 1 {
    binary.insert(Character("0"), at: 0)
    binary.insert(Character("0"), at: 0)
}

for i in stride(from: 0, to: binary.count, by: 3) {
    var a = 0
    var b = 0
    var c = 0
    if i < binary.count {
        a = Int(String(binary[i]))!
    }
    if i+1 < binary.count {
        b = Int(String(binary[i+1]))!
    }
    if i+2 < binary.count {
        c = Int(String(binary[i+2]))!
    }
    result += octFragment(a, b, c)
}
print(result)