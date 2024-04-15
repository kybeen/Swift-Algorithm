import Foundation

let expression = Array(readLine()!).map { String($0) }
var nums = [Int]()
var calcs = [String]()

var num = ""
for chr in expression {
    // +나 -라면
    if chr == "+" || chr == "-" {
        calcs.append(chr)
        nums.append(Int(num)!)
        num = ""
    } else { // 숫자라면
        num += chr
    }
}
nums.append(Int(num)!) // 마지막 숫자 처리

var result = nums[0]
var isAfterMinus = false // -가 나온 이후부터는 다 빼주면 됨
for i in 0..<calcs.count {
    if isAfterMinus {
        result -= nums[i+1]
    } else {
        if calcs[i] == "+" {
            result += nums[i+1]
        } else {
            isAfterMinus = true
            result -= nums[i+1]
        }
    }
}

print(result)