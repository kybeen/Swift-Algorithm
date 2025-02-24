import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var answer = [Int]()
    
    for yellowHeight in 1...Int(sqrt(Double(yellow))) {
        if yellow % yellowHeight == 0 {
            let yellowWidth = yellow / yellowHeight
            
            if (yellowHeight*2) + (yellowWidth*2) + 4 == brown {
                answer = [yellowWidth+2, yellowHeight+2]
                break
            }
        }
    }
    return answer
}