import Foundation

let NMB = readLine()!.split(separator: " ").map { Int($0)! }
let N = NMB[0] // 세로
let M = NMB[1] // 가로
var B = NMB[2] // 인벤토리에 들어 있는 블록 개수

var totalBlock = B // 전체 블록 개수
var land = [[Int]]()
for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    land.append(row)
    totalBlock += row.reduce(0, +)
}

var maxHeight = totalBlock / (N*M) // 있는 블록들로 가능한 가장 높은 높이
var result: (time: Int, height: Int) = (Int.max, maxHeight)

// 가능한 높이에 대해 모두 확인
/// 어차피 최대 높이는 총 블록 개수에 기반해서 가능한 높이로 설정되어 있기 때문에 인벤토리 개수까지 고려할 필요 없이, 높은 블록들 먼저 제거해주면 된다.
for height in 0...maxHeight {
    var time = 0
    
    for i in 0..<N {
        for j in 0..<M {
            // 현재 맞추려는 높이보다 높다면 높은만큼 제거하고 인벤토리로 (2초)
            if land[i][j] > height {
                let removeBlock = land[i][j] - height
                time += 2*(removeBlock)
            } else if land[i][j] < height {
                // 현재 맞추려는 높이보다 낮다면 낮은만큼 블록 추가
                if land[i][j] < height {
                    let addBlock = height - land[i][j]
                    time += (addBlock)
                }
            }
        }
    }
    
    if time <= result.time {
        result = (time, height)
    }
}

print(result.time, result.height)