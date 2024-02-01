import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var width = 0 
    var height = 0
    
    for size in sizes {
        let a = size[0]
        let b = size[1]
        
        // 명함 별로 큰 쪽을 가로, 작은 쪽을 세로에 넣어준다.
        if a > b {
            width = max(width, a)
            height = max(height, b)
        } else {
            width = max(width, b)
            height = max(height, a)
        }
    }
    
    return width*height
}