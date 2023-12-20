import Foundation

let n = Int(readLine()!)!
var deque = [Int]()
for _ in 0..<n {
    let command = readLine()!.components(separatedBy: " ")
    switch command[0] {
    case "push_front":
        deque.insert(Int(command[1])!, at: 0)
    case "push_back":
        deque.append(Int(command[1])!)
    case "pop_front":
        print(!deque.isEmpty ? deque.removeFirst() : -1)
    case "pop_back":
        print(!deque.isEmpty ? deque.removeLast() : -1)
    case "size":
        print(deque.count)
    case "empty":
        print(deque.isEmpty ? 1 : 0)
    case "front":
        print(!deque.isEmpty ? deque.first! : -1)
    case "back":
        print(!deque.isEmpty ? deque.last! : -1)
    default:
        break
    }
}