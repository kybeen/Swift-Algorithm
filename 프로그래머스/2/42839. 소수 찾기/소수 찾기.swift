import Foundation

func solution(_ numbers:String) -> Int {
    let numbers = Array(numbers).map { String($0) }
    let n = numbers.count
    
    func checkPrime(_ num: Int) -> Bool {
        if num < 4 {
            if num <= 1 { return false }
            else { return true}
        }
        guard num % 2 != 0 else { return false }
        
        for i in 2...num/2+1 {
            if num % i == 0 {
                return false
            }
        }
        return true
    }
    
    var num = [String]()
    var visited = [Bool](repeating: false, count: n)
    var nums = Set<Int>()
    var result = 0
    
    func dfs() {
        if !num.isEmpty {
            let nowNumber = Int(num.joined(separator: ""))!
            nums.insert(nowNumber)
        }
        
        for i in 0..<n {
            if !visited[i] {
                num.append(numbers[i])
                visited[i] = true
                dfs()
                visited[i] = false
                num.popLast()
            }
        }
    }
    
    dfs()
    for num in nums {
        if checkPrime(num) {
            result += 1
        }
    }
    
    return result
}