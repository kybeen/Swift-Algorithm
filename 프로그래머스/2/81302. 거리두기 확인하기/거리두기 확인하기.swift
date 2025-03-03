import Foundation

struct Point {
    let i: Int
    let j: Int
    
    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }
    
    // 맨해튼 거리를 구하는 함수
    func getManhattanDist(_ point: Point) -> Int {
        return abs(self.i - point.i) + abs(self.j - point.j)
    }
}

// 응시자 좌표를 구하는 함수
func getParticipantPoints(_ place: [[String]]) -> [Point] {
    var participants = [Point]()
    for i in 0..<5 {
        for j in 0..<5 {
            if place[i][j] == "P" {
                participants.append(Point(i,j))
            }
        }
    }
    return participants
}

// 맨해튼 거리가 2인 응시자 사이가 파티션으로 분리되어 있는지
func isSeparatedWithPartition(_ aPoint: Point, _ bPoint: Point, _ place: [[String]]) -> Bool {
    let iDiff = abs(aPoint.i - bPoint.i)
    let jDiff = abs(aPoint.j - bPoint.j)
    let isDiagonal = (iDiff == 1) && (jDiff == 1)
    var isSeparated = false
    
    if isDiagonal { // 대각선으로 떨어져 있는 경우
        if (place[aPoint.i][bPoint.j] == "X") && (place[bPoint.i][aPoint.j] == "X") {
            isSeparated = true
        }
    } else { // 직선 거리로 떨어져 있는 경우
        let center: Point!
        if iDiff == 2 {
            center = Point((aPoint.i+bPoint.i)/2, aPoint.j)
        } else {
            center = Point(aPoint.i, (aPoint.j+bPoint.j)/2)
        }
        if place[center.i][center.j] == "X" {
            isSeparated = true
        }
    }
    return isSeparated
}

func solution(_ places:[[String]]) -> [Int] {
    var result = [Int]()
    
    placeLoop: for place in places {
        let placeArr = place.map({ $0.map({ String($0) }) })
        var participants = getParticipantPoints(placeArr) // 응시자들 좌표
        if participants.count == 0 {
            result.append(1)
            continue placeLoop
        }
        
        for a in 0..<participants.count-1 {
            for b in a+1..<participants.count {
                let aPoint = participants[a]
                let bPoint = participants[b]
                let dist = aPoint.getManhattanDist(bPoint)
                if dist == 1 {
                    result.append(0)
                    continue placeLoop
                } else if dist == 2 {
                    if !isSeparatedWithPartition(aPoint, bPoint, placeArr) {
                        result.append(0)
                        continue placeLoop
                    }
                }
            }
        }
        result.append(1)
    }
    
    return result
}