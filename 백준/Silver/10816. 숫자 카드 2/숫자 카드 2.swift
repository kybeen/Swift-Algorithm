import Foundation

let N = Int(readLine()!)!
var cards = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
let M = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }

var dict = [Int:Int]() // key에 해당하는 수의 개수
for card in cards {
    if dict[card] != nil {
        dict[card]! += 1
    } else {
        dict[card] = 1
    }
}

func binarySearch(target: Int) -> Bool {
    var start = 0
    var end = N
    
    while start+1 < end {
        let mid = (start + end) / 2
        
        if target >= cards[mid] {
            start = mid
        } else {
            end = mid
        }
    }
    
    if target == cards[start] {
        return true
    } else {
        return false
    }
}

var result = ""
for num in nums {
    if binarySearch(target: num) {
        result += "\(dict[num]!) "
    } else {
        result += "0 "
    }
}
print(result)