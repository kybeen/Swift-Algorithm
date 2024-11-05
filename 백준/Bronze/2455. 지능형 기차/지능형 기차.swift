var stations = [(out: Int, in: Int)]()

for _ in 0..<4 {
    let outAndIn = readLine()!.split(separator: " ").map({ Int($0)! })
    let outCount = outAndIn[0]
    let inCount = outAndIn[1]
    stations.append((outCount, inCount))
}

var nowCount = 0
var result = 0
stations.forEach { station in
    nowCount -= station.out
    result = max(result, nowCount)
    nowCount += station.in
    result = max(result, nowCount)
}
print(result)