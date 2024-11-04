import Foundation

testCase: while true {
    let firstLine = readLine()!.split(separator: " ")
    let nx = Int(firstLine[0])!
    let ny = Int(firstLine[1])!
    let w = Double(firstLine[2])!
    guard !(nx == 0 && ny == 0 && w == 0.0) else { exit(0) }

    let x = readLine()!.split(separator: " ").map({ Double($0)! }).sorted(by: <)
    let y = readLine()!.split(separator: " ").map({ Double($0)! }).sorted(by: <)
    
    if !isJandiLineCrashed(pointArr: x, width: w, totalLength: 75.0) { continue testCase }
    if !isJandiLineCrashed(pointArr: y, width: w, totalLength: 100.0) { continue testCase }
    print("YES")
}

func isJandiLineCrashed(pointArr: [Double], width: Double, totalLength: Double) -> Bool {
    let half = width / 2
    var start: Double = 0.0
    for i in 0..<pointArr.count {
        guard pointArr[i] - half <= start else {
            print("NO")
            return false
        }
        if i == pointArr.count-1 {
            guard pointArr[i] + half >= totalLength else {
                print("NO")
                return false
            }
        }
        start = pointArr[i] + half
    }
    return true
}