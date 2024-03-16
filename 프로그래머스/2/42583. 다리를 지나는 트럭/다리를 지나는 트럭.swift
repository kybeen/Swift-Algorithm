import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var waiting = truck_weights // 현재 대기 중인 트럭
    var bridge = [Int]() // 다리를 건너는 트럭
    var progress = [Int]() // 다리를 건너는 트럭이 다리를 다 건널 때까지 남은 시간
    
    bridge.append(waiting.removeFirst())
    progress.append(bridge_length)
    var time = 1 // 걸린 시간
    
    while !progress.isEmpty {
        progress = progress.map { $0 - 1 } // 트럭들 한 칸씩 이동
        time += 1 // 1초 경과
        
        // 맨 앞의 트럭이 다리를 지나면 제거
        if progress.first! == 0 {
            _ = bridge.removeFirst()
            _ = progress.removeFirst()
        }
        
        // 대기 중인 트럭이 있을 때
        if !waiting.isEmpty {
            // 다리에 트럭이 들어갈 자리가 있으면
            if bridge.count < bridge_length {
                // 무게 합을 견딜 수 있으면
                if bridge.reduce(0, +) + waiting.first! <= weight {
                    // 다리에 트럭 추가
                    bridge.append(waiting.removeFirst())
                    progress.append(bridge_length)
                }
            }
        }
    }
    
    return time
}