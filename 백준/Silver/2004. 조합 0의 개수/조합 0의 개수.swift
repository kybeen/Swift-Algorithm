import Foundation

func getTwoCnt(_ num: Int) -> Int {
    var cnt = 0
    var i = 2
    while num >= i {
        cnt += num / i
        i *= 2
    }
    return cnt
}
func getFiveCnt(_ num: Int) -> Int {
    var cnt = 0
    var i = 5
    while num >= i {
        cnt += num / i
        i *= 5
    }
    return cnt
}

let nums = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nums[0]
let m = nums[1]

if n <= 1 {
    print(0)
} else {
    let twoCase = getTwoCnt(n) - getTwoCnt(m) - getTwoCnt(n-m)
    let fiveCase = getFiveCnt(n) - getFiveCnt(m) - getFiveCnt(n-m)
    print(min(twoCase, fiveCase))
}