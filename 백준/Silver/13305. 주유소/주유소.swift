let N = Int(readLine()!)!
let roads = readLine()!.split(separator: " ").map { Int($0)! }
let oil = readLine()!.split(separator: " ").map { Int($0)! }

var money = roads[0] * oil[0]
var cheapest = oil[0]
for now in 1..<N-1 {
    cheapest = min(cheapest, oil[now])
    money += (roads[now] * cheapest)
}
print(money)