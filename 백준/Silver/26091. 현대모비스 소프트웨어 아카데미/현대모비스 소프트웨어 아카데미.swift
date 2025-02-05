let NM = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (NM[0], NM[1])

let abilities = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var result = 0

var big = 0
var small = N-1
while big < small {
    if abilities[big] + abilities[small] >= M {
        result += 1
        big += 1
        small -= 1
    } else {
        small -= 1
    }
}

print(result)