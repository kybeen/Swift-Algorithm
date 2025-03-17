let HW = readLine()!.split(separator: " ").map({ Int($0)! })
let (H, W) = (HW[0], HW[1])
let blocks = readLine()!.split(separator: " ").map({ Int($0)! })

// i번째 칸의 왼쪽/오른쪽에서 가장 높은 블록
var leftHighest = Array<Int>(repeating: 0, count: blocks.count)
var rightHighest = Array<Int>(repeating: 0, count: blocks.count)

var answer = 0

if W > 1 {
    var right = 1
    var lHighest = blocks[0]
    while right < blocks.count {
        leftHighest[right] = lHighest
        if blocks[right] > lHighest {
            lHighest = blocks[right]
        }
        right += 1
    }
    
    var left = blocks.count - 2
    var rHighest = blocks[blocks.count-1]
    while left >= 0 {
        rightHighest[left] = rHighest
        if blocks[left] > rHighest {
            rHighest = blocks[left]
        }
        left -= 1
    }
    
    for i in 0..<blocks.count {
        let upperBound = min(leftHighest[i], rightHighest[i])
        let pond = max(0, upperBound - blocks[i])
        answer += pond
    }
}

print(answer)