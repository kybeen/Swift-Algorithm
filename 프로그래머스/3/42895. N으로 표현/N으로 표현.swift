import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    var result = Int.max
    // N과 number가 같은 경우 바로 정답
    if N == number { return 1 }
    
    var dp = Array(repeating: Set<Int>(), count: 9)
    // NNN... 형식의 수 먼저 추가
    for i in 1...8 {
        var temp = 0
        for k in 0..<i {
            temp += N * Int(pow(Double(10), Double(k)))
        }
        dp[i].insert(temp)
    }
    
    // ex) dp[3] => dp[1]과 dp[2]의 조합 + NNN
    for nowCnt in 2...8 {
        // 왼쪽
        for k in 1..<nowCnt {
            for left in dp[k] {
                for right in dp[nowCnt-k] {
                    dp[nowCnt].insert(left + right)
                    dp[nowCnt].insert(left * right)
                    // 왼쪽과 오른쪽을 바꿨을 때도 고려해야 하는 경우는 빼기,나누기
                    dp[nowCnt].insert(left - right)
                    if left != 0 && right != 0 {
                        dp[nowCnt].insert(left / right)
                    }
                }
            }
        }
    }
    
    // 만들어진 dp 테이블을 보고 N 구하기
    // dp 테이블을 채우기 전에 NNN... 형식의 수를 먼저 넣어놓았기 때문에 다 종료된 후 N을 구해야 함
    for i in 1...8 {
        for num in dp[i] {
            if num == number {
                result = min(result, i)
            }
        }
    }
    if result == Int.max { return -1 }
    
    return result
}