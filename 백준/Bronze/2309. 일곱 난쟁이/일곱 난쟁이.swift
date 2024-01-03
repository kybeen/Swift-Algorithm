import Foundation

var dwarfs = [Int]()
for _ in 0..<9 {
    dwarfs.append(Int(readLine()!)!)
}

totalLoop: for i in 0..<8 {
    for j in i+1..<9 {
        var temp = dwarfs
        temp.remove(at: temp.firstIndex(of: dwarfs[i])!)
        temp.remove(at: temp.firstIndex(of: dwarfs[j])!)
        let result = temp.reduce(0){ $0 + $1 }
        if result == 100 {
            temp.sort()
            temp.map{ print($0) }
            break totalLoop
        }
    }
}