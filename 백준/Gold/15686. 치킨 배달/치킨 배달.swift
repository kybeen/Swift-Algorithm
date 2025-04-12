import Foundation

struct Point: Equatable {
    let i: Int
    let j: Int
    
    var description: String {
        "(\(i), \(j))"
    }
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
}

let NM = readLine()!.split(separator: " ").map({ Int($0)! })
let (N, M) = (NM[0], NM[1])
var town = [[Int]]()
for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map({ Int($0)! })
    town.append(row)
}

var houses = [Point]()
var chickens = [Point]()
for i in 0..<N {
    for j in 0..<N {
        if town[i][j] == 1 {
            houses.append(Point(i,j))
        } else if town[i][j] == 2 {
            chickens.append(Point(i,j))
        }
    }
}
//print(houses.map({ $0.description }))
//print(chickens.map({ $0.description }))

// M개 치킨집 조합 구하기
var chickenCombinations = [[Point]]()
var stk = [Point]()
func dfs(_ now: Int) {
    if stk.count == M {
        chickenCombinations.append(stk)
        return
    }
    
    for next in now+1..<chickens.count {
        stk.append(chickens[next])
        dfs(next)
        _ = stk.popLast()
    }
}
dfs(-1)

// 각 조합 별 도시의 치킨 거리 구하기
var answer = Int.max
for comb in chickenCombinations {
    var sum = 0
    for house in houses {
        var houseChickenDist = Int.max
        for chicken in comb {
            let nowDist = abs(house.i - chicken.i) + abs(house.j - chicken.j)
            houseChickenDist = min(houseChickenDist, nowDist)
        }
        sum += houseChickenDist
    }
    answer = min(answer, sum)
}

print(answer)