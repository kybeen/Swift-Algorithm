let T = Int(readLine()!)!
var result = [String]()
for _ in 0..<T {
    let yearStr = readLine()!
    let nextYear = Int(yearStr)! + 1
    let suffixNum = Int(yearStr.suffix(2))!
    let isGood = (nextYear % suffixNum == 0)
    result.append(isGood ? "Good" : "Bye")
}
result.forEach { print($0) }