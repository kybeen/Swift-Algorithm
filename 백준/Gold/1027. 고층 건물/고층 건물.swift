let N = Int(readLine()!)!
var buildings: [Int] = [0]
buildings.append(contentsOf: readLine()!.split(separator: " ").map({ Int($0)! }))
var dict = [Int: Int]() // [빌딩 번호: 보이는 빌딩 수]

func crossLine(_ a: Double, _ b: Double, _ x: Int, _ y: Int) -> Bool {
    let calculatedY = (a * Double(x)) + b
    return Double(y) >= calculatedY
}

for x1 in 1...N {
    for x2 in 1...N {
        guard x1 != x2 else { continue }
        let y1 = Double(buildings[x1])
        let y2 = Double(buildings[x2])
        let a = Double(y2 - y1) / Double(x2 - x1)
        let b = y1 - (a * Double(x1))
        
        var isCrossLine = false
        if x1 < x2 {
            for betweenX in x1+1..<x2 {
                let betweenY = buildings[betweenX]
                if crossLine(a, b, betweenX, betweenY) {
                    isCrossLine = true
                    break
                }
            }
            if !isCrossLine { dict[x1, default: 0] += 1 }
        } else {
            for betweenX in x2+1..<x1 {
                let betweenY = buildings[betweenX]
                if crossLine(a, b, betweenX, betweenY) {
                    isCrossLine = true
                    break
                }
            }
            if !isCrossLine { dict[x1, default: 0] += 1 }
        }
    }
}

if !dict.isEmpty {
    print(dict.values.max()!)
} else {
    print(0)
}