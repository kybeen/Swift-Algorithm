func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var result = [Character]()
    var num = 0
    
    while result.count < t*m {
        let radixNum = String(num, radix: n).uppercased()
        result.append(contentsOf: radixNum)
        num += 1
    }
    
    var tubeNum: String = ""
    for i in 0..<t {
        let index = result.index(result.startIndex, offsetBy: i * m + (p-1))
        tubeNum.append(result[index])
    }
    
    return tubeNum
}