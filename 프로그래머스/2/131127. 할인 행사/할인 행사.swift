import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var wantDict = [String: Int]()
    for i in 0..<want.count {
        wantDict[want[i]] = number[i]
    }
    
    var result = 0
    for i in 0...discount.count-10 {
        var checkDict = wantDict
        for day in 0..<10 {
            let sale = discount[i+day]
            if checkDict[sale] != nil {
                checkDict[sale]! -= 1
            }
        }
        let restDict = checkDict.filter { $0.value != 0 }
        result += (restDict.isEmpty) ? 1 : 0
    }
    
    return result
}