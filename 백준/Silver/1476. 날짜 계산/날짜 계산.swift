import Foundation

let nums = readLine()!.split(separator: " ").map{ Int($0)! }
let e = nums[0]
let s = nums[1]
let m = nums[2]

var year = 1
while true {
    var earth = year % 15
    var sun = year % 28
    var moon = year % 19
    
    earth = (earth == 0) ? 15 : earth
    sun = (sun == 0) ? 28 : sun
    moon = (moon == 0) ? 19 : moon
    
    if earth == e && sun == s && moon == m {
        print(year)
        break
    } else {
        year += 1
    }
}