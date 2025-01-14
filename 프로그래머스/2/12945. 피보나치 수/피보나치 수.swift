func solution(_ n:Int) -> Int {
    var fibonacci = Array(repeating: 0, count: n+1)
    fibonacci[0] = 0
    fibonacci[1] = 1
    
    for n in 2...n {
        fibonacci[n] = (fibonacci[n-1] + fibonacci[n-2]) % 1234567
    }
    
    return fibonacci[n]
}