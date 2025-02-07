let NK = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (NK[0], NK[1])

typealias Nation = (num: Int, gold: Int, silver: Int, bronze: Int)
var nations = [Nation]()
for _ in 0..<N {
    let nation = readLine()!.split(separator: " ").map { Int($0)! }
    nations.append((nation[0], nation[1], nation[2], nation[3]))
}
// 금 >= 은 >= 동 순으로 정렬
nations.sort {
    if $0.gold != $1.gold {
        return $0.gold > $1.gold
    } else {
        if $0.silver != $1.silver {
            return $0.silver > $1.silver
        } else {
            if $0.bronze != $1.bronze {
                return $0.bronze > $1.bronze
            } else {
                return true
            }
        }
    }
}

// rank[i] : 국가i의 등수
var rank = Array(repeating: 0, count: N+1)
rank[nations[0].num] = 1
for i in 1..<N {
    let isSameGold = nations[i-1].gold == nations[i].gold
    let isSameSilver = nations[i-1].silver == nations[i].silver
    let isSameBronze = nations[i-1].bronze == nations[i].bronze
    
    if isSameGold && isSameSilver && isSameBronze {
        rank[nations[i].num] = rank[nations[i-1].num]
    } else {
        rank[nations[i].num] = i+1
    }
}

print(rank[K])