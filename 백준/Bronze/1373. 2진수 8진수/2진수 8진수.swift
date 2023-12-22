import Foundation

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
    let octFrag = Int(String(binary[i]))!*4 + Int(String(binary[i+1]))!*2 + Int(String(binary[i+2]))!*1
    result += String(octFrag)
}
print(result)