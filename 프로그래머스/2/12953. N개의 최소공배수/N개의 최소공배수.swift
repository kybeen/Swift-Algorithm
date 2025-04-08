func gcd(_ a: Int, _ b: Int) -> Int {
    let rest = a % b
    if rest == 0 {
        return b
    } else {
        return gcd(b, rest)
    }
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution(_ arr:[Int]) -> Int {
    return arr.reduce(arr[0]) { lcm($0, $1) }
}