var result = [Int]()
let T = Int(readLine()!)!
for _ in 0..<T {
    let hl = readLine()!.split(separator: " ").map { Int($0)! }
    let (height, length) = (hl[0], hl[1])
    var building = [[Int]]() // building[i][j]: i번 층의 j번 위치에 있는 차
    var floorInfo = [Int: Int]() // 각 손님 번호 별 층수 정보 (인덱스 편의상 0층부터 시작)
    for i in 0..<height {
        let belt = readLine()!.split(separator: " ").map { Int($0)! }
        for customer in belt {
            if customer != -1 {
                floorInfo[customer, default: 0] = i
            }
        }
        building.append(belt)
    }
    
    var time = 0
    for (customer, floor) in floorInfo.sorted(by: { $0.key < $1.key }) {
        var belt = building[floor]
        var rotationCount = 0
        while let first = belt.first, first != customer {
            let last = belt.removeFirst()
            belt.append(last)
            rotationCount += 1
        }
        building[floor] = belt // 회전된 벨트 반영
        let reverseRotationCount = length - rotationCount
        rotationCount = min(rotationCount, reverseRotationCount) // 시계/반시계 방향 중 적은 회전수
        
        time += (floor * 10 * 2) // 층 왕복 이동 시간
        time += (rotationCount * 5) // 컨베이어 벨트 회전 시간
    }
    result.append(time)
}
result.forEach { print($0) }