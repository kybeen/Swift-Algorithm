let NK = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (NK[0], NK[1])
typealias Lecture = (ab: Int, ac: Int, bc: Int)
var lectures = [Lecture]()
for _ in 0..<N {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    let lecture = (a+b, a+c, b+c)
    lectures.append(lecture)
}

let sortedByAB = lectures.sorted { $0.ab > $1.ab }
let sortedByAC = lectures.sorted { $0.ac > $1.ac }
let sortedByBC = lectures.sorted { $0.bc > $1.bc }
var abSum = 0
var acSum = 0
var bcSum = 0
for i in 0..<K {
    abSum += sortedByAB[i].ab
    acSum += sortedByAC[i].ac
    bcSum += sortedByBC[i].bc
}
print(max(abSum, acSum, bcSum))