let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map({ Int($0)! }).sorted(by: >)
let x = Int(readLine()!)!

var result = 0
var left = 0 // 큰 수
var right = n-1 // 작은 수
while left < right {
    let sum = nums[left] + nums[right]
    if sum == x {
        result += 1
        left += 1
        right -= 1
    } else if sum < x {
        right -= 1
    } else {
        left += 1
    }
    
}
print(result)