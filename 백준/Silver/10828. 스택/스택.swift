import Foundation

let cmdNum = Int(readLine()!)!
var stack = [Int]()
for _ in 0..<cmdNum {
    let command = readLine()!.split(separator: " ")
    // push 커맨드일 때
    if command.count == 2 {
        stack.append(Int(command[1])!)
    } else { // push 이외의 커맨트
        let cmd = command[0]
        switch cmd {
        case "pop":
            if !stack.isEmpty {
                print(stack.removeLast())
            } else {
                print(-1)
            }
        case "size":
            print(stack.count)
        case "empty":
            if stack.isEmpty {
                print(1)
            } else {
                print(0)
            }
        case "top":
            if let top = stack.last {
                print(top)
            } else {
                print(-1)
            }
        default:
            break
        }
    }
}
