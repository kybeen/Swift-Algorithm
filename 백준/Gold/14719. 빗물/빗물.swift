let HW = readLine()!.split(separator: " ").map({ Int($0)! })
let (H, W) = (HW[0], HW[1])
var blocks = readLine()!.split(separator: " ").map({ Int($0)! })

var leftMaxHeight = Array(repeating: 0, count: W)
var rightMaxHeight = Array(repeating: 0, count: W)

// 각 위치를 기준으로 가장 높은 왼쪽 블록 높이 구하기
var left = 0
var right = 0
while right < W {
    if blocks[left] > blocks[right] {
        leftMaxHeight[right] = blocks[left]
    } else {
        left = right
    }
    right += 1
}

// 각 위치를 기준으로 가장 높은 오른쪽 블록 높이 구하기
left = W - 1
right = W - 1
while left >= 0 {
    if blocks[right] > blocks[left] {
        rightMaxHeight[left] = blocks[right]
    } else {
        right = left
    }
    left -= 1
}

var result = 0
for i in 0..<W {
    let upperBound = min(leftMaxHeight[i], rightMaxHeight[i])
    result += max(0, upperBound - blocks[i])
}
print(result)