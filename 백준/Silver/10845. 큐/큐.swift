import Foundation

let n = Int(readLine()!)!
var queue = [Int]()
for _ in 0..<n {
    let command = readLine()!.components(separatedBy: " ")
    switch command[0] {
    case "push":
        queue.append(Int(command[1])!)
    case "pop":
        if !queue.isEmpty {
            print(queue.removeFirst())
        } else {
            print(-1)
        }
    case "size":
        print(queue.count)
    case "empty":
        if queue.isEmpty {
            print(1)
        } else {
            print(0)
        }
    case "front":
        if let front = queue.first {
            print(front)
        } else {
            print(-1)
        }
    case "back":
        if let back = queue.last {
            print(back)
        } else {
            print(-1)
        }
    default:
        break
    }
}