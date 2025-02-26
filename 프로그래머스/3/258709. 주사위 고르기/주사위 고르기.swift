import Foundation

func solution(_ dice:[[Int]]) -> [Int] {
    let n = dice.count
    var diceCombinations = [[Int]]()
    var scores = [[Int]]() // scores[i] : diceCombinations[i]번째 조합 주사위에서 가능한 모든 점수
    
    // 한 명이 가져가는 주사위의 모든 경우의 수 구하기 (diceCombinations 만들기)
    var stk = [Int]()
    func getAllDiceCase(_ now: Int) {
        if stk.count == n / 2 {
            diceCombinations.append(stk)
            return
        }
        
        for diceIdx in now..<n {
            if !stk.contains(diceIdx) {
                stk.append(diceIdx)
                getAllDiceCase(diceIdx)
                _ = stk.popLast()
            }
        }
    }
    getAllDiceCase(0)
    
    // 주사위 경우의 수 별로 가능한 모든 합을 구하는 함수 (정렬된 배열로 반환)
    func getPossibleSums(_ dices: [[Int]]) -> [Int] {
        var sums = [0]
        
        for dice in dices {
            var newSums = [Int]()
            for value in dice {
                for sum in sums {
                    newSums.append(sum+value)
                }
            }
            sums = newSums
        }
        
        return sums.sorted()
    }
    // 정렬된 A와 B의 점수 조합으로 A의 총 승리 횟수를 구하는 함수
    func getWinCountOfA(_ aSums: [Int], _ bSums: [Int]) -> Int {
        var winCount = 0
        let bCount = bSums.count
        for aSum in aSums {
            var start = 0
            var end = bCount
            while start + 1 < end {
                let mid = (start + end) / 2
                if bSums[mid] < aSum {
                    start = mid
                } else {
                    end = mid
                }
            }
            winCount += start
        }
        return winCount
    }
    
    // 주사위 조합 별 가능한 점수들 구하기
    for diceCombination in diceCombinations {
        scores.append(getPossibleSums(diceCombination.map({ dice[$0] })))
    }
    
    var a = 0
    var b = diceCombinations.count-1
    var bestWin: (winCount: Int, combination: [Int]) = (0, [])
    while a < diceCombinations.count {
        let winCount = getWinCountOfA(scores[a], scores[b])
        if winCount > bestWin.winCount {
            bestWin = (winCount, diceCombinations[a])
        }
        a += 1
        b -= 1
    }
    
    
    return bestWin.combination.map({ $0 + 1 })
}