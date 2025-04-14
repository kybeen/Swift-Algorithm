import Foundation

var answer = [String]()

while let input = readLine()?.split(separator: " ").map({ Int($0)! }) {
    if input[0] == 0 { break }
    let nums = Array(input.dropFirst())
//    print(k, nums)
    var testCaseResult = ""
    
    var stk = [Int]()
    func dfs(_ now: Int) {
        if stk.count == 6 {
            testCaseResult += stk.map({ String($0) }).joined(separator: " ")
            testCaseResult += "\n"
            return
        }
        
        for i in now+1..<nums.count {
            stk.append(nums[i])
            dfs(i)
            _ = stk.popLast()
        }
    }
    dfs(-1)
    answer.append(testCaseResult)
}

print(answer.joined(separator: "\n"))