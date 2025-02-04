let NS = readLine()!.split(separator: " ").map { Int($0)! }
let (N, S) = (NS[0], NS[1])
let locations = [0] + readLine()!.split(separator: " ").map { Int($0)! }
let fuels = [0] + readLine()!.split(separator: " ").map { Int($0)! }

var idx = 0
typealias QueueItem = (car: Int, location: Int, fuel: Int)
var queue = [QueueItem]()
var visited = Array(repeating: false, count: N+1)

queue.append(QueueItem(S, locations[S], fuels[S]))
visited[S] = true

while idx < queue.count {
    let now = queue[idx]
    
    var nextCar = now.car + 1
    while (nextCar <= N), (now.location+now.fuel >= locations[nextCar]) {
        if !visited[nextCar] {
            visited[nextCar] = true
            queue.append(QueueItem(nextCar, locations[nextCar], fuels[nextCar]))
        }
        nextCar += 1
    }
    
    nextCar = now.car - 1
    while (nextCar > 0), (now.location-now.fuel <= locations[nextCar]) {
        if !visited[nextCar] {
            visited[nextCar] = true
            queue.append(QueueItem(nextCar, locations[nextCar], fuels[nextCar]))
        }
        nextCar -= 1
    }
    
    idx += 1
}

print((1...N).compactMap({ visited[$0] ? String($0) : nil }).joined(separator: " "))
