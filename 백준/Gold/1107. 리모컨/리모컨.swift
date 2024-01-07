import Foundation

let n = Int(readLine()!)! // 이동하려고 하는 채널
let brokenNum = Int(readLine()!)! // 고장난 버튼의 개수
var buttons: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
if brokenNum != 0 {
    let brokenButtons = Array(readLine()!)
    buttons = buttons.filter{ !brokenButtons.contains($0) }
}

var nowChannel = 100
var result = abs(n - nowChannel)
nowChannel = 0
// 500,000보다 큰 번호로 이동 후 +,- 를 누르는 경우도 고려해야 하기 때문에 범위를 1,000,000으로 잡음
while nowChannel <= 1000000 {
    let nowChannelStr = String(nowChannel)
    // 현재 채널 번호가 누를 수 있는 번호들로 구성되어 있는지 확인
    var isPossible = true
    for chr in nowChannelStr {
        if !buttons.contains(chr) {
            isPossible = false
            break
        }
    }
    // 누를 수 없는 번호가 있다면 패스
    guard isPossible else {
        nowChannel += 1
        continue
    }
    // 누를 수 있는 번호라면 버튼 누르는 횟수 체크 후 최솟값 갱신
    var cnt = nowChannelStr.count
    cnt += abs(n - nowChannel)
    result = min(result, cnt)
    
    nowChannel += 1
}

print(result)