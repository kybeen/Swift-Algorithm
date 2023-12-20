import Foundation

let str = Array(readLine()!)
var result = ""
var isTag = false
var temp: String = ""
for s in str {
    switch s {
    case "<":
        // 태그 이전까지의 temp의 문자열을 뒤집어서 result에 추가해준다.
        result += temp.reversed()
        temp = ""
        isTag = true
        result += "<"
    case ">":
        isTag = false
        result += ">"
    case " ":
        if !isTag {
            result += temp.reversed()
            temp = ""
        }
        result += " "
    default:
        if isTag {
            result += String(s)
        } else { // 태그가 아니라면 temp에 따로 넣어준다
            temp += String(s)
        }
    }
}
if temp.count != 0 {
    result += temp.reversed()
}
print(result)
