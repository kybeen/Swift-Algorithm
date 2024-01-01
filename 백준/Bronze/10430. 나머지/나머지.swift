import Foundation

let nums = readLine()!.split(separator: " ").map{ Int($0)! }
let a = nums[0]
let b = nums[1]
let c = nums[2]

print( (a+b)%c )
print( ((a%c) + (b%c))%c )
print( (a*b)%c )
print( ((a%c) * (b%c))%c )