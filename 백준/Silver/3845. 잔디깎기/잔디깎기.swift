import Foundation

testCase: while true {
    let firstInput = readLine()!.split(separator: " ")
    let nx = Int(firstInput[0])!
    let ny = Int(firstInput[1])!
    let w = Double(firstInput[2])!
    let wHalf = w / 2
    guard !(nx == 0 && ny == 0 && w == 0.0) else { exit(0) }

    let x = readLine()!.split(separator: " ").map({ Double($0)! }).sorted(by: <)
    let y = readLine()!.split(separator: " ").map({ Double($0)! }).sorted(by: <)
    
    var left: Double = 0.0
    var up: Double = 0.0
    for i in 0..<nx {
        guard x[i] - wHalf <= left else {
            print("NO")
            continue testCase
        }
        if i == nx-1 {
            guard x[i] + wHalf >= 75.0 else {
                print("NO")
                continue testCase
            }
        }
        left = x[i] + wHalf
    }
    for i in 0..<ny {
        guard y[i] - wHalf <= up else {
            print("NO")
            continue testCase
        }
        if i == ny-1 {
            guard y[i] + wHalf >= 100.0 else {
                print("NO")
                continue testCase
            }
        }
        up = y[i] + wHalf
    }
    print("YES")
}