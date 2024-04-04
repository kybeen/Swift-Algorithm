import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)
let M = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{ Int($0)! }

func binarySearch(target: Int) -> Bool {
    var result = false
    var start = 0
    var end = N-1
    
    while start <= end {
        let mid = (start + end) / 2
        if target == A[mid] {
            result = true
            break
        } else if target < A[mid] {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return result
}

for num in nums {
    if binarySearch(target: num) {
        print(1)
    } else {
        print(0)
    }
}