import Foundation

let T = Int(readLine()!)!
(0..<T).forEach { _ in
    let xy = readLine()!.split(separator: " ").map{( Int($0)! )}
    let distance = xy[1] - xy[0]
    print(calcMachineCount(targetDistance: distance))
}

func calcMachineCount(targetDistance: Int) -> Int {
    guard targetDistance >= 3 else { return targetDistance }
    
    /// 홀수 점화식 : x + (x/2)^2
    /// 짝수 점화식 : f(x-1) + x
    var base = 1
    var lastEvenMaxDist = 2
    while true {
        let oddCount = (base * 2) + 1 // 홀수
        let evenCount = oddCount + 1 // 짝수
        
        let oddMaxDist = oddCount + Int(pow(floor(Double(oddCount) / Double(2)), 2))
        let evenMaxDist = lastEvenMaxDist + evenCount
        
        if (lastEvenMaxDist+1...oddMaxDist) ~= targetDistance {
            return oddCount
        }
        if (oddMaxDist+1...evenMaxDist) ~= targetDistance {
            return evenCount
        }
        
        base += 1
        lastEvenMaxDist = evenMaxDist
    }
}