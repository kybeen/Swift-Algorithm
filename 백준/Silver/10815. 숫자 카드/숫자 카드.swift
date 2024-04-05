import Foundation

let N = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
let M = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }

func binarySearch(target: Int) -> Bool {
    var start = 0
    var end = N
    
    while start + 1 < end {
        let mid = (start + end) / 2
        if target >= cards[mid] {
            start = mid
        } else {
            end = mid
        }
    }
    
    if cards[start] == target {
        return true
    } else {
        return false
    }
}

var result = ""
for num in nums {
    if binarySearch(target: num) {
        result += "1 "
    } else {
        result += "0 "
    }
}
print(result)
