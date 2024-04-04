import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)
let M = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{ Int($0)! }

func binarySearch(target: Int) -> Bool {
    var start = 0
    var end = N
    
    while start + 1 < end {
        let mid = (start + end) / 2
        
        if target >= A[mid] {
            start = mid
        } else {
            end = mid
        }
    }
    
    if A[start] == target {
        return true
    } else {
        return false
    }
}

for num in nums {
    if binarySearch(target: num) {
        print(1)
    } else {
        print(0)
    }
}