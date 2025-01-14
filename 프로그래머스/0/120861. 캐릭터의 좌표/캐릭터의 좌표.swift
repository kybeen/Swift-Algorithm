import Foundation

func solution(_ keyinput:[String], _ board:[Int]) -> [Int] {
    let up = [0, 1]
    let down = [0, -1]
    let left = [-1, 0]
    let right = [1, 0]
    let horizontalThreshold = (board[0] >= 3) ? ((board[0]-1)/2) : 0 // 가로 방향으로 넘으면 안되는 크기
    let verticalThreshold = (board[1] >= 3) ? ((board[1]-1)/2) : 0 // 세로 방향으로 넘으면 안되는 크기
    var result = [0, 0]
    
    for key in keyinput {
        if key == "up" {
            result[0] += up[0]
            result[1] += up[1]
        } else if key == "down" {
            result[0] += down[0]
            result[1] += down[1]
        } else if key == "left" {
            result[0] += left[0]
            result[1] += left[1]
        } else if key == "right" {
            result[0] += right[0]
            result[1] += right[1]
        }
        
        if ((result[0] > 0) && (result[0] > horizontalThreshold)) {
            result[0] -= 1
        } else if (result[0] < 0) && (result[0] < -horizontalThreshold) {
            result[0] += 1
        }
        
        if ((result[1] > 0) && (result[1] > verticalThreshold)) {
            result[1] -= 1
        } else if (result[1] < 0) && (result[1] < -verticalThreshold) {
            result[1] += 1
        }
    }
    
    return result
}