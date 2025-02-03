let NK = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (NK[0], NK[1])
var bids = [Int]()
for _ in 0..<N {
    let bidInfo = readLine()!.split(separator: " ").map { Int($0)! }
    bids.append(bidInfo[0] - bidInfo[1])
}
var successCount = 0
var X = 0
for bid in bids.sorted(by: >) {
    guard successCount < K else { break }
    
    if bid < 0 {
        X = abs(bid)
    }
    successCount += 1
}

print(X)