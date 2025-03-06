import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var sameCount = 0
    // 0이 아닌 숫자들 고려했을 때 일치하는 번호 개수
    for lotto in lottos.filter({ $0 != 0 }) {
        if win_nums.contains(lotto) {
            sameCount += 1
        }
    }
    
    // 최저 순위에서 0개수만큼 더 맞춘 경우가 최고 순위임
    let zeroCount = lottos.filter({ $0 == 0 }).count
    let lowest = min(6, 7 - sameCount)
    let highest = max(1, lowest - zeroCount)
    
    return [highest, lowest]
}