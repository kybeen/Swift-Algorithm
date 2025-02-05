let LC = readLine()!.split(separator: " ").map { Int($0)! }
let (L, C) = (LC[0], LC[1]) // L:암호 길이 / C:문자 종류
var alphabets = readLine()!.split(separator: " ").map { String($0) }.sorted()

var password = [String]()
var result = [String]()
func dfs(_ now: Int, _ jaeum: Int, _ moeum: Int) {
    if password.count == L {
        if moeum >= 1 && jaeum >= 2 {
            result.append(password.joined())
        }
        return
    }
    
    for i in now..<alphabets.count {
        let alphabet = alphabets[i]
        password.append(alphabet)
        if ["a", "i", "o", "u", "e"].contains(alphabet) {
            dfs(i+1, jaeum, moeum+1)
        } else {
            dfs(i+1, jaeum+1, moeum)
        }
        _ = password.popLast()
    }
}

dfs(0, 0, 0)
result.forEach { print($0) }