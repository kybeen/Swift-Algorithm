import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let area = brown + yellow // 가로x세로 == brown+yellow == 넓이
    let maxHeight = Int(sqrt(Double(area)))
    var result = [0, 0]
    
    // 세로는 항상 가로 이하이기 때문에 넓이의 제곱근까지만 확인
    for height in 3...maxHeight {
        let yellowHeight = height - 2
        let yellowWidth = yellow / (yellowHeight)
        let yellowCount = yellowHeight * yellowWidth
        let brownCount = (yellowHeight*2) + (yellowWidth*2) + 4
        if yellowCount == yellow && brownCount == brown {
            result = [area / height, height]
        }
    }
    
    return result
}